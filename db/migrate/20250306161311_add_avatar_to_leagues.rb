class AddAvatarToLeagues < ActiveRecord::Migration[7.1]
  def change
    add_column :leagues, :avatar, :string
  end
end
