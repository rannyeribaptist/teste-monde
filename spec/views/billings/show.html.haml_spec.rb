require 'rails_helper'

RSpec.describe "billings/show", type: :view do
  before(:each) do
    @billing = assign(:billing, Billing.create!(
      client: nil,
      value: "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/9.99/)
  end
end