FactoryBot.define do
  factory :product do
    name { Faker::Beer.name }
    photo_url { Faker::Internet.url }
    barcode { Faker::IDNumber.valid }
    price_cents { Faker::Number.number(4) }
    sku { Faker::Number.number(4) }
    producer { Faker::Company.name }
  end
end
