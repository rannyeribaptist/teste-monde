FactoryBot.define do
  factory :payment_method do
    trait :credit do
      name    { "Crédito" }
      message { "Pagamento autorizado" }
    end

    trait :debit do
      name    { "Débito" }
      message { "Pagamento débitado" }
    end

    trait :billet do
      name    { "Boleto" }
      message { "Boleto gerado" }
    end

    trait :pix do
      name    { "Pix" }
      message { "transferência realizada" }
    end
  end

  factory :credit, traits: [:credit]
  factory :debit, traits: [:debit]
  factory :billet, traits: [:billet]
  factory :pix, traits: [:pix]
end
