require 'rails_helper'

RSpec.describe "billings/new", type: :view do
  before(:each) do
    assign(:billing, Billing.new(
      client_id: create(:client).id,
      payment_method_id: create(:payment_method, :credit).id
    ))
  end

  it "renders new billing form" do
    render

    assert_select "form[action=?][method=?]", billings_path, "post" do

      assert_select "select[name=?]", "billing[client_id]"
      assert_select "select[name=?]", "billing[payment_method_id]"
    end
  end
end
