class AddAvatarToPlayers < ActiveRecord::Migration[7.1]
  def change
    add_column :players, :avatar, :string
  end
end
