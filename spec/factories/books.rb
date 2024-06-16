FactoryBot.define do
  factory :book do
    title {  Faker::Book.title }
    synopsis { Faker::Lorem.paragraph }
    author
    genre
    publisher
    user
  end
end
