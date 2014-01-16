# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) { |x| "e#{x}xample@aol.com" }
    password 'password'
    password_confirmation 'password'
    cohort 'winter 2013'
  end
end
