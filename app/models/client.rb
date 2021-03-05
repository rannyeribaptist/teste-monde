# == Schema Information
#
# Table name: clients
#
#  id                   :bigint           not null, primary key
#  name                 :string
#  last_billed_at       :date
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class Client < ApplicationRecord
  ##
  # Constants

  ##
  # Attributes

  ##
  # Enums

  ##
  # Behaviours

  ##
  # Relationships
  has_many :billings
  has_one :client_payment_method

  ##
  # Validations
  validates_presence_of :name, :billing_day

  ##
  # Callbacks

  ##
  # Scopes
  scope :ready_to_bill, -> { where('clients.billing_day <= ?', Date.today.day) }

  ##
  # Class Methods

  ##
  # Instance Methods
  def payment_method_name
    return 'Não há nenhum método de pagamento associado à este cliente' unless self.client_payment_method.present?
    self.client_payment_method.payment_method.name
  end

  def payment_method_message
    return 'Não há nenhum método de pagamento associado à este cliente' unless self.client_payment_method.present?
    self.client_payment_method.payment_method.message
  end

  def bill!
    BillingService.new(self).make_bill
  end

  def billed?
    self.last_billed_at&.month.eql? Date.today.month
  end
end
