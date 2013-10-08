require 'faker'


FactoryGirl.define do
  factory :user do |f|
    f.password { Faker::Lorem.characters(6..20) }
    f.email { Faker::Internet.email }
  end
end
