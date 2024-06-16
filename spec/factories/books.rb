FactoryBot.define do
  factory :book do
    title { "MyString" }
    synopsis { "MyText" }
    author { nil }
    genre { nil }
    publisher { nil }
    user { nil }
  end
end
