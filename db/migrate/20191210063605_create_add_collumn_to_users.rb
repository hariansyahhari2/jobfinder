class CreateAddCollumnToUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :add_collumn_to_users do |t|
      add_column :users, :first_name, :string
      add_column :users, :last_name, :string
      add_column :users, :experience_status, :string
      add_column :users, :attachment, :string
      t.timestamps
    end
  end
end
