FactoryBot.define do
  factory :event do
    start_date { "2019-02-28" }
    duration { 15 }
    title { Faker::Lorem.characters(10)}
    description { Faker::Lorem.characters(25) }
    price { Faker::Number.number(3) }
    location { "Paris"}
    admin { FactoryBot.create(:user) }
  end
end
