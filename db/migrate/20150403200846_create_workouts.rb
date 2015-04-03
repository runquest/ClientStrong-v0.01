class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.references :client, index: true
      t.string :title
      t.date :date
      t.text :description

      t.timestamps null: false
    end
    add_foreign_key :workouts, :clients
  end
end
