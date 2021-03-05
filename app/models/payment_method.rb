# == Schema Information
#
# Table name: payment_methods
#
#  id                   :bigint           not null, primary key
#  name                 :string
#  message              :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class PaymentMethod < ApplicationRecord
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

  ##
  # Validations
  validates_presence_of :name, :message

  ##
  # Callbacks

  ##
  # Scopes

  ##
  # Class Methods

  ##
  # Instance Methods

end
