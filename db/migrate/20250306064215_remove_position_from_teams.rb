class RemovePositionFromTeams < ActiveRecord::Migration[7.1]
  def change
    remove_column :teams, :position, :integer
  end
end
