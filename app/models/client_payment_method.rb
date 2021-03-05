# == Schema Information
#
# Table name: client_payment_methods
#
#  id                   :bigint           not null, primary key
#  client_id            :integer          not null
#  payment_method_id    :integer          not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class ClientPaymentMethod < ApplicationRecord
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

  ##
  # Scopes

  ##
  # Class Methods

  ##
  # Instance Methods
end
