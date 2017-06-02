require 'faker'

FactoryGirl.define do
  factory :movie do |f|
    f.title { Faker::Book.title }
    f.description { Faker::Lorem.paragraph }
    f.year { Random.rand(1990...2020) }
  end
end