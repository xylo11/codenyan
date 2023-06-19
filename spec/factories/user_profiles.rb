FactoryBot.define do
  factory :user_profile do
    user
    nickname { Faker::Name.name }
    avatar { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test_avatar.png')) }
  end
end