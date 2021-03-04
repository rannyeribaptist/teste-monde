class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.date :last_billed_at
      t.date :billing_date

      t.timestamps
    end
  end
end
