# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :gift do
    campaign_id 1
    gift_price 1
    gift_name "MyString"
    gift_description "MyString"
    gift_amount 1
  end
end
