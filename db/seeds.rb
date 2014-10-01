require 'net/http'
classes = JSON.parse(Net::HTTP.get_response(URI.parse("http://us.battle.net/api/wow/data/character/classes")).body)
if classes['status'] == 'nok'
  raise BattleNetError.new(message: classes['reason'])
else
  classes['classes'].each do |data|
    character_class = CharacterClass.find_or_create_by!(name: data['name'],
                                                        blizzard_id: data['id'])
  end
end

specs = JSON.parse(Net::HTTP.get_response(URI.parse("http://us.battle.net/api/wow/data/talents")).body)
if specs['status'] == 'nok'
  raise BattleNetError.new(message: classes['reason'])
else
  specs['classes'].each do |data|
    character_class = CharacterClass.find_or_create_by!(name: data['name'],
                                                        blizzard_id: data['id'])
  end
end