# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name 'Test User'
    email 'test@foo.bar'
    password 'testpassword'
    password_confirmation 'testpassword'
  end
end
