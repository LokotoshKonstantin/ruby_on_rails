class AddPhotoToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :photo, :string
    add_column :admin_users, :photo, :string
  end
end
