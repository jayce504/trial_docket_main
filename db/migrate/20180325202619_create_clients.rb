class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.string :appointed_retained
      t.string :alleged_offenses

      t.timestamps null: false
    end
  end
end
