# == Schema Information
#
# Table name: admins
#
#  id                       :bigint           not null, primary key
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  email                    :string           not null, default("")
#  encrypted_password       :string           not null, default("")
#  reset_password_token     :string
#  reset_password_sent_at   :datetime
#  remember_created_at      :datetime
#
class Admin < ApplicationRecord
  ##
  # Constants

  ##
  # Attributes

  ##
  # Enums

  ##
  # Behaviours
  devise :database_authenticatable, :recoverable, :validatable

  ##
  # Relationships

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
