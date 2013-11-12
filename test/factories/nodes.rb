# Read about factories at https://github.com/thoughtbot/factory_girl

require 'securerandom'

FactoryGirl.define do
  factory :node do
    mac_address "MyString"
    pub_key { SecureRandom.hex }
    user_id 1
  end
end
