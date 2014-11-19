FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "john#{n}@example.com"
    end
    password '12345678'
  end
end