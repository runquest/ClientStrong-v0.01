class AddAvatarToClients < ActiveRecord::Migration
  def change
    add_column :clients, :avatar, :string
  end
end
