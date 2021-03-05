# == Schema Information
#
# Table name: billings
#
#  id                   :bigint           not null, primary key
#  accounted_at         :date
#  client_id            :integer          not null
#  payment_method_id    :integer          not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class Billing < ApplicationRecord
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
  belongs_to :client
  belongs_to :payment_method

  ##
  # Validations

  ##
  # Callbacks
  after_create :set_accounted_at

  ##
  # Scopes
  scope :today, -> { where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day) }

  ##
  # Class Methods

  ##
  # Instance Methods
  def set_accounted_at
    self.update(accounted_at: Date.today)
  end
end
