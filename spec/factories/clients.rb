FactoryBot.define do
  factory :client do
    name { Faker::Name.name }
    billing_day { Date.today.day }

    trait :billed do
      last_billed_at { Date.today - 1.month }
    end
  end

  factory :billed, traits: [:billed]
end
