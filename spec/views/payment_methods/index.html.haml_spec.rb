require 'rails_helper'

RSpec.describe "payment_methods/index", type: :view do
  before(:each) do
    assign(:payment_methods, [
      PaymentMethod.create!(
        name: "Name",
        message: "Message"
      ),
      PaymentMethod.create!(
        name: "Name",
        message: "Message"
      )
    ])
  end

  it "renders a list of payment_methods" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Message".to_s, count: 2
  end
end
