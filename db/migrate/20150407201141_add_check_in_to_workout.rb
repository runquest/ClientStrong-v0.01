class AddCheckInToWorkout < ActiveRecord::Migration
  def change
    add_column :workouts, :check_in, :integer
  end
end
