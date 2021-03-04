class Client < ApplicationRecord
  has_many :billings
  has_one :client_payment_method

  validates_presence_of :name, :billing_date

  def payment_method_name
    return 'Não há nenhum método de pagamento associado à este cliente' unless self.client_payment_method.present?

    self.client_payment_method.payment_method.name
  end

  def payment_method_message
    return 'Não há nenhum método de pagamento associado à este cliente' unless self.client_payment_method.present?

    self.client_payment_method.payment_method.message
  end
end
