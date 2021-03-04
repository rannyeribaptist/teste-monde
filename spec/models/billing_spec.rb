require 'rails_helper'

RSpec.describe Billing, type: :model do
  it { should validate_presence_of :accounted_at }
  it { should validate_presence_of :value }
  it { should belong_to :client }
  it { should belong_to :payment_method }

  describe "Create" do
    subject { build(:billing, client: build(:client), payment_method: build(:payment_method, :credit)) }

    context "with value greater than 0" do
      before { subject.value = 10.0 }

      it {
        expect(subject).to be_valid
      }
    end

    context "with value equal or less than 0" do
      before { subject.value = 0 }

      it {
        expect(subject).not_to be_valid
      }
    end
  end
end
