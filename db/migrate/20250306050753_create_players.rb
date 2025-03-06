class CreatePlayers < ActiveRecord::Migration[7.1]
  def change
    create_table :players do |t|
      t.integer :player_id
      t.string :first_name
      t.string :last_name
      t.integer :position
      t.integer :jersey_number
      t.date :dob
      t.integer :team_id

      t.timestamps
    end
  end
end
