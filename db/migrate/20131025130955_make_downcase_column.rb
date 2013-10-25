class MakeDowncaseColumn < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.text :name_downcase
    end
  end

  def down
    change_table :users do |t|
      t.delete :name_downcase
    end
  end
end
