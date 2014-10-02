#Talents
classes = JSON.parse(Net::HTTP.get_response(URI.parse("http://us.battle.net/api/wow/data/character/classes")).body)
if classes['status'] == 'nok'
  raise BattleNetError.new(message: classes['reason'])
else
  classes['classes'].each do |data|
    character_class = CharacterClass.find_or_create_by!(name: data['name'],
                                                        blizzard_id: data['id'])
  end
end

# Specs
specs = JSON.parse(Net::HTTP.get_response(URI.parse("http://us.battle.net/api/wow/data/talents")).body)
if specs['status'] == 'nok'
  raise BattleNetError.new(message: classes['reason'])
else
  specs.each do |class_index, data|
    character_class = CharacterClass.find_by(name: data['class'].titleize)
    if character_class
      # Add talents
      data['specs'].each do |spec|
        ClassSpec.create(character_class: character_class, name: spec['name'])
      end
    end
  end
end

# Effects
effects = JSON.parse(File.read('config/effects.json'))
effects.each do |effect|
  Effect.find_or_create_by!(name: effect)
end

# Add spells
PopulateSpells.populate('config/spells.json')
PopulateSpells.populate('config/hunter.json')