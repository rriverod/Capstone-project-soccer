class RemovePositionFromPlayers < ActiveRecord::Migration[7.1]
  def change
    remove_column :players, :position, :integer
  end
end
