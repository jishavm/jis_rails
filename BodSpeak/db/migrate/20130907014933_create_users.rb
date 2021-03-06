class CreateUsers < ActiveRecord::Migration
  def change
    drop_table :users
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :user_type
      t.string :password_digest

      t.timestamps
    end
  end
end
