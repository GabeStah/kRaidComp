class CreateCharacterClasses < ActiveRecord::Migration
  def change
    create_table :character_classes do |t|
      t.integer :blizzard_id
      t.string :name

      t.timestamps
    end
  end
end
