class Billing < ApplicationRecord
  belongs_to :client
  belongs_to :payment_method

  after_create :set_accounted_at

  def set_accounted_at
    self.update(accounted_at: Date.today)
  end
end
