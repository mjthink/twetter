FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker.name }
    password '12345678'
    password_confirmation '12345678'
    username { Faker.bothify('??????????###') }
  end
end
