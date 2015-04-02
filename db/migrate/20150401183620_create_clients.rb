class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.integer :age
      t.string :email
      t.date :start_date
      t.boolean :active

      t.timestamps null: false
    end
  end
end
