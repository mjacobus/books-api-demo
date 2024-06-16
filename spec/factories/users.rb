FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    access_token { SecureRandom.uuid }
  end
end
