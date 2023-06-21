FactoryBot.define do
  factory :park do
    name { Faker::Lorem.word }
    association :user
  end
end