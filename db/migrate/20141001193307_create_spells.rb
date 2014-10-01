class CreateSpells < ActiveRecord::Migration
  def change
    create_table :spells do |t|
      t.string :name
      t.blizzard_id :integer, unique: true

      t.timestamps
    end
  end
end
