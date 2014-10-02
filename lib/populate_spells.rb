module PopulateSpells

  def self.populate(path)
    data = JSON.parse(File.read(path))
    data.each do |class_name, spells|
      character_class = CharacterClass.find_by(name: class_name)
      if character_class
        spells.each do |spell_data|
          spell = Spell.find_or_create_by(id: spell_data['id'])
          if spell
            # update name
            spell.name = spell_data['name']
            spell_data['specs'].each do |spec_name|
              if spec_name == 'all'
                # Add to each spec for matching class
                class_specs = ClassSpec.where(character_class: character_class)
                class_specs.each do |class_spec|
                  spell.class_specs << class_spec
                  spell.save
                end
              else
                spell.class_specs << ClassSpec.find_or_create_by(character_class: character_class, name: spec_name)
                spell.save
              end
            end
            spell_data['effects'].each do |effect_name|
              spell.effects << Effect.find_or_create_by(name: effect_name)
              spell.save
            end
          end
        end
      end
    end
  end
end