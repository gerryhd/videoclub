require 'rails_helper'

RSpec.describe RentItem, type: :model do

  it "has a valid factory" do
    FactoryGirl.create(:rent_item).should be_valid
  end

  describe "association" do
    it "is invalid without an associated rent cart" do
      FactoryGirl.build(:rent_item, rent_cart: nil).should_not be_valid
    end
    it "is invalid without an associated movie" do
      FactoryGirl.build(:rent_item, movie: nil)
    end
  end
end
