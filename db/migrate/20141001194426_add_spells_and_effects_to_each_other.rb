class AddSpellsAndEffectsToEachOther < ActiveRecord::Migration
  def change
    create_table :spells_effects, id: false do |t|
      t.belongs_to :spells
      t.belongs_to :effects
    end
  end
end