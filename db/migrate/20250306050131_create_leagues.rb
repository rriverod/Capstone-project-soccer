class CreateLeagues < ActiveRecord::Migration[7.1]
  def change
    create_table :leagues do |t|
      t.integer :league_id
      t.string :league_name
      t.date :start_date
      t.date :end_date
      t.integer :number_of_teams

      t.timestamps
    end
  end
end
