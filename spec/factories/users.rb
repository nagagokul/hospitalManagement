FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "test-#{n}@example.com" }
    password  "abc123"
  end
end
