# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "MyString"
    email "MyString@test.com"
    password "12345678"
    password_confirmation "12345678"
  end
end
