class AddCharacterClassToClassSpec < ActiveRecord::Migration
  def change
    add_reference :class_specs, :character_class, index: true, unique: true, name: 'by_class_spec_character_class'
  end
end
