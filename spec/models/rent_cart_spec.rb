require 'rails_helper'

describe RentCart do
  it "has a valid factory" do
    FactoryGirl.create(:rent_cart).should be_valid
  end
  it "is invalid without user" do
    FactoryGirl.build(:rent_cart, user: nil).should_not be_valid
  end
end