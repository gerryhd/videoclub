

FactoryGirl.define do
  factory :rent_cart do |f|
    f.user { FactoryGirl.create(:user) }

  end
end