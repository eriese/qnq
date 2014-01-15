class AddFamiliarityToFlags < ActiveRecord::Migration
  def change
    change_table :flags do |t|
      t.integer :familiarity
    end
  end
end
