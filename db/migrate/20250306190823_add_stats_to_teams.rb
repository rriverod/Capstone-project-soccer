class AddStatsToTeams < ActiveRecord::Migration[7.1]
  def change
    add_column :teams, :wins, :integer
    add_column :teams, :draws, :integer
    add_column :teams, :losses, :integer
    add_column :teams, :goals_for, :integer
    add_column :teams, :goals_against, :integer
    add_column :teams, :goal_difference, :integer
    add_column :teams, :points, :integer
  end
end
