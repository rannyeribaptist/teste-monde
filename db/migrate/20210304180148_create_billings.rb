class CreateBillings < ActiveRecord::Migration[6.1]
  def change
    create_table :billings do |t|
      t.date :accounted_at
      t.belongs_to :client, null: false, foreign_key: true
      t.belongs_to :payment_method, null: false, foreign_key: true
      t.decimal :value

      t.timestamps
    end
  end
end
