FactoryGirl.define do
  factory :post do
    name 'ship it'
    url 'www.shipit.com'

    association :user
  end
end
