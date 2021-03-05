require 'rails_helper'

RSpec.describe "billings/index", type: :view do
  before(:each) do
    assign(:billings, [
      Billing.create!(
        client_id: create(:client).id,
        payment_method_id: create(:payment_method, :billet).id
      ),
      Billing.create!(
        client_id: create(:client).id,
        payment_method_id: create(:payment_method, :billet).id
      )
    ])
  end

  it "renders a list of billings" do
    render
    assert_select "tr>td", text: "Boleto", count: 2
  end
end
