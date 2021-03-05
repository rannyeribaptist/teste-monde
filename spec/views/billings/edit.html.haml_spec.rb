require 'rails_helper'

RSpec.describe "billings/edit", type: :view do
  before(:each) do
    @billing = assign(:billing, Billing.create!(
      client_id: create(:client).id,
      payment_method_id: create(:payment_method, :credit).id
    ))
  end

  it "renders the edit billing form" do
    render

    assert_select "form[action=?][method=?]", billing_path(@billing), "post" do

      assert_select "select[name=?]", "billing[client_id]"
      assert_select "select[name=?]", "billing[payment_method_id]"
    end
  end
end
