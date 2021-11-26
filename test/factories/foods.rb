FactoryBot.define do
  factory :food do
    name { Faker::Name.name }
    measurement_unit { 'kilos' }
    price { Faker::Number.within(range: 1..5) }
  end
end
