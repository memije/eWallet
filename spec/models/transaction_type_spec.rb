require 'rails_helper'

RSpec.describe TransactionType, type: :model do

	it 'is not valid without a name' do
		transaction_type = TransactionType.new
		expect(	transaction_type ).not_to be_valid
	end

end
