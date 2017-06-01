require 'rails_helper'

RSpec.describe Movie, type: :model do
  it "has a valid factory" do
    FactoryGirl.create(:movie).should be_valid
  end

  describe "presence validations: " do
    context "without title" do
      it "is invalid" do
        FactoryGirl.build(:movie, title: nil).should_not be_valid
      end
    end
    context "without description" do
      it "is invalid" do
        FactoryGirl.build(:movie, description: nil).should_not be_valid
      end
    end
    context "without year" do
      it "is invalid" do
        FactoryGirl.build(:movie, year: nil).should_not be_valid
      end
    end
  end

  describe "create_slug method" do
    it "sets slug to the title with spaces replaced by dash" do
      movie = FactoryGirl.create(:movie)
      movie.slug.should eql(movie.title.downcase.gsub(' ', '-'))

    end
  end

  it "is available after created" do
    FactoryGirl.create(:movie).available.should eql(true)
  end

  # TODO: Add validation for the movie poster

end
