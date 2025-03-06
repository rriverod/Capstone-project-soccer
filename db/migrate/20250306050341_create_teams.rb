class CreateTeams < ActiveRecord::Migration[7.1]
  def change
    create_table :teams do |t|
      t.integer :team_id
      t.string :team_name
      t.integer :number_of_players
      t.integer :position
      t.integer :league_id

      t.timestamps
    end
  end
end
