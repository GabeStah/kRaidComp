class AddSpellsAndEffectsToEachOther < ActiveRecord::Migration
  def change
    create_table :effects_spells, id: false do |t|
      t.belongs_to :spell
      t.belongs_to :effect
    end
    add_index :effects_spells, [:spell_id, :effect_id], unique: true, name: 'by_effect_and_spell'
  end
end