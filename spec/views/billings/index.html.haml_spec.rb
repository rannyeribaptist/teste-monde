require 'rails_helper'

RSpec.describe "billings/index", type: :view do
  before(:each) do
    assign(:billings, [
      Billing.create!(
        client: nil,
        value: "9.99"
      ),
      Billing.create!(
        client: nil,
        value: "9.99"
      )
    ])
  end

  it "renders a list of billings" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
  end
end
