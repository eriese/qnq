class AddSecondUserPhoto < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.string :fb_photo_large
    end
  end

  def down
  end
end
