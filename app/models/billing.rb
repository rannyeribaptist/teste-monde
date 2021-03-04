class Billing < ApplicationRecord
  belongs_to :client
  belongs_to :payment_method

  validates_presence_of :accounted_at, :value

  validates :value, numericality: { greater_than: 0 }
end
