require 'faker'

FactoryGirl.define do
  factory :post do |f|
    f.title { Faker::Company.catch_phrase }
    f.body { Faker::Lorem.paragraph(sentence_count = 3) }
  end
end
