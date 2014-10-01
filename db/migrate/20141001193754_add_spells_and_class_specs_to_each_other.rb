class AddSpellsAndClassSpecsToEachOther < ActiveRecord::Migration
  def change
    create_table :class_specs_spells, id: false do |t|
      t.belongs_to :class_spec
      t.belongs_to :spell
    end
  end
end
