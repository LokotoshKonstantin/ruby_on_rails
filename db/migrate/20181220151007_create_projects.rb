class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.date :release_data
      t.belongs_to :team
      t.timestamp
    end
    create_table :teams do |t|
      t.string :name
      t.timestamp
    end
    add_column :admin_users, :team_id, :integer, null: true
  end
end
