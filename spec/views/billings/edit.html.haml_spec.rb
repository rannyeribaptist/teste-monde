require 'rails_helper'

RSpec.describe "billings/edit", type: :view do
  before(:each) do
    @billing = assign(:billing, Billing.create!(
      client: nil,
      value: "9.99"
    ))
  end

  it "renders the edit billing form" do
    render

    assert_select "form[action=?][method=?]", billing_path(@billing), "post" do

      assert_select "input[name=?]", "billing[client_id]"

      assert_select "input[name=?]", "billing[value]"
    end
  end
end
