class CreateAddAgeToUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :add_age_to_users do |t|
      add_column :users, :age, :int
    end
  end
end