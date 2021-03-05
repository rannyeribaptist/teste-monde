require 'rails_helper'

RSpec.describe "billings/show", type: :view do
  before(:each) do
    @billing = assign(:billing, Billing.create!(
      client_id: create(:client).id,
      payment_method_id: create(:payment_method, :credit).id
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Accounted at/)
    expect(rendered).to match(/Client/)
    expect(rendered).to match(/Payment Method/)
  end
end
