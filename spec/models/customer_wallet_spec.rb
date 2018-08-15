require 'rails_helper'

RSpec.describe CustomerWallet, type: :model do

  it 'is invalid if wallet, customer pair is not unique' do
  	wallet = Wallet.create
  	customer = Customer.create({
  		name: "Some name",
  		email: "clever@email.com",
  		password: "this_is_a_password",
  		password_confirmation: "this_is_a_password",
  		wallet: wallet
  	})

  	first_association = CustomerWallet.create({
  		wallet: wallet,
  		customer: customer
  	})

  	second_association = CustomerWallet.create({
  		wallet: wallet,
  		customer: customer
  	})

  	expect( second_association ).not_to be_valid;

  end

  it 'returns the customer name concatenated wit the wallet id' do
	  wallet = Wallet.create
	  customer = Customer.create({
	  	name: "Some name",
	  	email: "clever@email.com",
	  	password: "this_is_a_password",
	  	password_confirmation: "this_is_a_password",
	  	wallet: wallet
	  })

	  first_association = CustomerWallet.create({
	  	wallet: wallet,
	  	customer: customer
	  })

	  expected_string = "#{wallet.customer.name} - #{wallet.name}"

	  expect(	first_association.wallet_name_with_customer ).to eq(expected_string)
  end

end
