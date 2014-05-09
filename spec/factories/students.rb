# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :student do
    name "MyString"
    address "MyString"
    state "MyString"
    country "MyString"
    phone "MyString"
    email "MyString@mystring.com"
    zip "45970"
    city "Istanbul"
  end
end
