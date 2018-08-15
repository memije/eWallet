require 'rails_helper'

RSpec.describe Card, type: :model do

	it 'is not valid without a card type' do

		customer = Customer.create({
  		name: "Test name",
  		email: "email@email.com",
  		password: "password_number_one"  		,
  		password_confirmation: "password_number_one"
  	})

		card = Card.new({
			card_name: "5555555555554444",
			expiration_date: "12/99",
			customer: customer,
			card_type: nil
		})

		expect(	card ).not_to be_valid;
	end

  it 'encripts card info on creation' do
  	card_name = "5555555555554444"
  	expiration_date = "12/99"
  	customer = Customer.create({
  		name: "Test name",
  		email: "email@email.com",
  		password: "password_number_one"  		,
  		password_confirmation: "password_number_one"
  	})
  	card_type = CardType.create(name: "Card Type 1")

  	card = Card.create({
			card_name: card_name,
			expiration_date: expiration_date,
			customer: customer,
			card_type: card_type
		})

		expect(	card.encrypted_card_name ).not_to eq(card_name)
		expect( card.encrypted_expiration_date ).not_to eq(expiration_date)

  end

  it 'returns the last 4 digits of the card using asterisks for the rest' do
	  card_name = "5555555555554444"
  	expiration_date = "12/99"
  	customer = Customer.create({
  		name: "Test name",
  		email: "email@email.com",
  		password: "password_number_one"  		,
  		password_confirmation: "password_number_one"
  	})
  	card_type = CardType.create(name: "Card Type 1")

  	card = Card.create({
			card_name: card_name,
			expiration_date: expiration_date,
			customer: customer,
			card_type: card_type
		})

		expected_string = "**** **** **** #{card_name[-4..-1]}"

		expect(	card.masked_card_name ).to eq(expected_string)

  end

end
