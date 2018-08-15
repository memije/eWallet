require 'rails_helper'

RSpec.describe Wallet, type: :model do

  it 'is valid without parameters' do
  	wallet = Wallet.new
  	expect(	wallet ).to be_valid
  end

  it 'has balance = 0 on creation' do
  	wallet = Wallet.create
  	expect(	wallet.balance ).to eq(0);
  end

  it 'has a hash name on creation' do
  	wallet = Wallet.create
  	expect(	wallet.name ).not_to be_nil;
  end
end
