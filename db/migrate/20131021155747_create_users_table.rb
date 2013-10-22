class CreateUsersTable < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.string :fb_email
      t.string :fb_pass
      t.string :gender
      t.string :sexuality
      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
