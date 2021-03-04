require 'rails_helper'

RSpec.describe Client, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :billing_date }

  describe "with client payment method" do
    subject { create(:client) }

    before(:each) do
      create(:payment_method, :billet)
      ClientPaymentMethod.create(client: subject, payment_method: PaymentMethod.first)
    end

    context "#payment_method_name" do
      it {
        expect(subject.payment_method_name).to eq('Boleto')
      }
    end

    context "#payment_method_message" do
      it {
        expect(subject.payment_method_message).to eq('Boleto gerado')
      }
    end
  end

  describe "without client payment method" do
    subject { create(:client) }

    before(:each) do
      create(:payment_method, :billet)
    end

    context "#payment_method_name" do
      it {
        expect(subject.payment_method_name).to eq('Não há nenhum método de pagamento associado à este cliente')
      }
    end

    context "#payment_method_message" do
      it {
        expect(subject.payment_method_message).to eq('Não há nenhum método de pagamento associado à este cliente')
      }
    end
  end
end
