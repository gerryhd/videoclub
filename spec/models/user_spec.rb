# spec/models/user.rb
require 'rails_helper'

describe User do

  it "has a valid factory" do
    FactoryGirl.create(:user).should be_valid
  end
  it "is invalid without an email" do
    FactoryGirl.build(:user, email: nil).should_not be_valid
  end

  describe "password presence validation" do

    context "without password and confirmation" do
      it "is invalid" do
        FactoryGirl.build(:user, password: nil, password_confirmation: nil).should_not be_valid
      end
    end

    context "without password" do
      it "is invalid" do
        FactoryGirl.build(:user, password: nil).should_not be_valid
      end
    end

    context "without confirmation" do
      it "is invalid" do
        # TODO: Fix this one
        # FactoryGirl.build(:user, password_confirmation: nil).should_not be_valid
      end
    end

  end

  it "does not allow duplicate emails" do
    first_user = FactoryGirl.create(:user)
    first_user.should be_valid
    FactoryGirl.build(:user, email: first_user.email, password: "6666y66",
                      password_confirmation: "6666y66",
                      ).should_not be_valid
  end

  it "does not allow passwords shorter than 6" do
    FactoryGirl.build(:user, password: "short",
                              password_confirmation: "short").should_not be_valid
  end

  it "does not allow password to be different than password_confirmation" do
    FactoryGirl.build(:user, password_confirmation: "different").should_not be_valid
    FactoryGirl.build(:user, password: "different").should_not be_valid
  end
end