require 'rails_helper'

RSpec.describe Customer, type: :model do

  it 'is not valid without a valid email' do
  	customer = Customer.create({
  		name: "Test name",
  		email: "this_is_not_an_email_address",
  		password: "password"  		,
  		password_confirmation: "password"
  	})

  	expect(	customer ).not_to be_valid
  end

	it 'is not valid if passwords dont  match' do
		customer = Customer.create({
  		name: "Test name",
  		email: "email@email.com",
  		password: "password_number_one"  		,
  		password_confirmation: "password_number_two"
  	})

  	expect(	customer ).not_to be_valid
	end

end
