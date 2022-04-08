FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "User #{n}" }
    sequence(:id) { |n| "user_id #{n}" }

    created_at { Time.now }
    updated_at { Time.now }
  end
end
