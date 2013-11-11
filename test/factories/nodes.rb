# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :node do
    mac_address "MyString"
    pub_key "MyString"
    user nil
  end
end
