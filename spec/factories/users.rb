require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.email    { Faker::Internet.email }
    password = Faker::Internet.password(8)
    f.password password
    f.password_confirmation password
    f.confirmed_at Date.today

  end
end