class ClientPaymentMethod < ApplicationRecord
  belongs_to :client
  belongs_to :payment_method
end
