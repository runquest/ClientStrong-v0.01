class AddCheckInToClient < ActiveRecord::Migration
  def change
    add_column :clients, :check_in, :integer, :default => 0
  end
end
