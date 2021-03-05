require 'rails_helper'

describe "rake routines:bill_clients", type: :task do
  context "execute" do
    it "should bill if billing_day is smaller or equal to today" do
      payment_method = create(:payment_method, :credit)

      client_1 = create(:client, billing_day: Date.today.day)
      ClientPaymentMethod.create(client: client_1, payment_method: payment_method)

      client_2 = create(:client, billing_day: (Date.today + 10.days).day)
      ClientPaymentMethod.create(client: client_2, payment_method: payment_method)

      expect {
        task.execute
      }.to change(Billing, :count).by(1)
    end

    it "should bonify only clients that have not yet been billed" do
      payment_method = create(:payment_method, :credit)

      client_1 = create(:client, billing_day: Date.today.day, last_billed_at: Date.today)
      ClientPaymentMethod.create(client: client_1, payment_method: payment_method)

      client_2 = create(:client, billing_day: Date.today.day, last_billed_at: (Date.today - 1.month))
      ClientPaymentMethod.create(client: client_2, payment_method: payment_method)

      expect {
        task.execute
      }.to change(Billing, :count).by(1)
    end
  end
end
