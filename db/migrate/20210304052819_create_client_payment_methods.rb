class CreateClientPaymentMethods < ActiveRecord::Migration[6.1]
  def change
    create_table :client_payment_methods do |t|
      t.belongs_to :client, null: false, foreign_key: true
      t.references :payment_method, null: false, foreign_key: true

      t.timestamps
    end
  end
end
