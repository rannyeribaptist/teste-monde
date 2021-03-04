class PaymentMethod < ApplicationRecord
  validates_presence_of :name, :message
end
