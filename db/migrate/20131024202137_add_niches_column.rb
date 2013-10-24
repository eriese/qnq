class AddNichesColumn < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.text :niche
    end
  end

  def down
    change_table :users do |t|
      t.delete :niche
    end
  end
end
