class RemoveLeagueIdFromLeagues < ActiveRecord::Migration[7.1]
  def change
    remove_column :leagues, :league_id, :integer
  end
end
