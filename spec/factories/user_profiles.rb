FactoryBot.define do
  factory :user_profile do
    nickname { "MyString" }
    intro { "MyText" }
    user { nil }
  end
end
