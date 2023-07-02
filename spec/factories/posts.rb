FactoryBot.define do
  factory :post do
    title { 'MyString' }
    content { 'MyText' }
    upvotes { 1 }
    downvotes { 1 }
    bookmark_counts { 1 }
    user { nil }
    park { nil }
  end
end
