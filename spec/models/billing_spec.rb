require 'rails_helper'

RSpec.describe Billing, type: :model do
  it { should belong_to :client }
  it { should belong_to :payment_method }

  describe "Create" do
    subject { build(:billing, client: build(:client), payment_method: build(:payment_method, :credit)) }

    context "after create" do
      before { subject.save }

      it {
        expect(subject.accounted_at).to eq(Date.today)
      }
    end
  end
end
