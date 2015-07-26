FactoryGirl.define do
  factory :post do
    title { Faker::Lorem.sentence }
    body  { Faker::Lorem.paragraphs(3).join("\n") }
  end
end
