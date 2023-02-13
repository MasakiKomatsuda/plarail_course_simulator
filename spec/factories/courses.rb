FactoryBot.define do
  factory :course do
    user { nil }
    title { "MyString" }
    description { "MyText" }
    image { "MyString" }
  end
end
