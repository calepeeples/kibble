# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :whitelist do
    fname "MyString"
    lname "MyString"
    user_id 1
    email "MyString"
    ssn 1
  end
end
