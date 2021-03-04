require 'rails_helper'

RSpec.describe "billings/new", type: :view do
  before(:each) do
    assign(:billing, Billing.new(
      client: nil,
      value: "9.99"
    ))
  end

  it "renders new billing form" do
    render

    assert_select "form[action=?][method=?]", billings_path, "post" do

      assert_select "input[name=?]", "billing[client_id]"

      assert_select "input[name=?]", "billing[value]"
    end
  end
end
