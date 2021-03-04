FactoryBot.define do
  factory :client do
    name { Faker::Name.name }
    billing_date { Date.today }

    trait :billed do
      last_billed_at { Date.today - 1.month }
    end
  end

  factory :billed, traits: [:billed]
end
