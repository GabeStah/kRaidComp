class AddCharacterClassToClassSpec < ActiveRecord::Migration
  def change
    add_reference :class_specs, :character_class, index: true
  end
end
