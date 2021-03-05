class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.date :last_billed_at
      t.integer :billing_day

      t.timestamps
    end
  end
end
