FactoryBot.define do
  factory :comment do
    content { 'MyText' }
    user { nil }
    post { nil }
    parent_comment_id { 1 }
  end
end
