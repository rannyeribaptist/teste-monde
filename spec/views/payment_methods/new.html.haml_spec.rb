require 'rails_helper'

RSpec.describe "payment_methods/new", type: :view do
  before(:each) do
    assign(:payment_method, PaymentMethod.new(
      name: "MyString",
      message: "MyString"
    ))
  end

  it "renders new payment_method form" do
    render

    assert_select "form[action=?][method=?]", payment_methods_path, "post" do

      assert_select "input[name=?]", "payment_method[name]"

      assert_select "input[name=?]", "payment_method[message]"
    end
  end
end
