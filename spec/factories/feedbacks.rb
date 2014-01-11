FactoryGirl.define do
  factory :feedback do
    comment 'That was awesome'

    association :user
  end
end
