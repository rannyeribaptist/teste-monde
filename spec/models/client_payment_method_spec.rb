require 'rails_helper'

RSpec.describe ClientPaymentMethod, type: :model do
  it { should belong_to :client }
  it { should belong_to :payment_method }
end
