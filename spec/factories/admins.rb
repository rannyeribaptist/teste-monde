FactoryBot.define do
  factory :admin do
    email { 'admin@test.com' }
    password { '123123' }
    password_confirmation { '123123' }
  end
end
