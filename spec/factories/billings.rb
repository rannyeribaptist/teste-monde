FactoryBot.define do
  factory :billing do
    accounted_at { "2021-03-04" }
    client { nil }
    value { "9.99" }
  end
end
