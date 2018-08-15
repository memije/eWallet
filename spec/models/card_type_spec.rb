require 'rails_helper'

RSpec.describe CardType, type: :model do

  it 'is not valid without a name' do
  	card_type = CardType.new
  	expect(	card_type ).not_to be_valid
  end

end
