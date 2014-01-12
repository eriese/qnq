class CreateFlags < ActiveRecord::Migration
  def change
    create_table :flags do |t|
      t.text :message
      t.integer :flagged_user
      t.integer :flagger
      t.boolean :positive
      t.timestamps
    end
  end
end
