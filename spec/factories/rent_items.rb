FactoryGirl.define do
  factory :rent_item do |f|
    f.rent_cart { FactoryGirl.create(:rent_cart) }
    f.movie { FactoryGirl.create(:movie) }
  end
end