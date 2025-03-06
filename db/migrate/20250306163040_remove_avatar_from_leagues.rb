class RemoveAvatarFromLeagues < ActiveRecord::Migration[7.1]
  def change
    remove_column :leagues, :avatar, :string
  end
end
