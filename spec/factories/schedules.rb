# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :schedule do
    company_id 1
    week_num { Date.today.cweek }
  end
end
