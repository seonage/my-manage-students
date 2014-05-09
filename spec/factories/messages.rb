# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    association :student
    association :user
    title "MyString"
    content "MyText"
  end
end
