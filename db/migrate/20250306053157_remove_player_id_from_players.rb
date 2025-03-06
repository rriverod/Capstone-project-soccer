class RemovePlayerIdFromPlayers < ActiveRecord::Migration[7.1]
  def change
    remove_column :players, :player_id, :integer
  end
end
