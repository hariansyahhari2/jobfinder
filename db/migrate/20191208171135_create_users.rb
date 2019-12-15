class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_salt
      t.string :password_hash
      t.integer :age
      t.string :role
      t.string :first_name
      t.string :last_name
      t.string :experience_status
      t.string :attachment
      t.string :activation_token
      t.string :activation_status
      t.timestamps
    end
  end
end
