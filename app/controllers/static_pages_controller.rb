class StaticPagesController < ApplicationController
  def index
    @column_count = 4
    @character_classes = CharacterClass.all.order(:name)
    class_specs = ClassSpec.all
    if params['spec']
      specs = Array.new
      params['spec'].each do |spec_id, count|
        class_spec = ClassSpec.find(spec_id)
        if class_spec && count.to_i > 0
          specs << Spec.new(class_spec: class_spec, count: count.to_i)
        end
      end
      roster = Roster.new(class_specs: class_specs, duplicates_allowed: params['duplicates_allowed'], max_size: params['roster_size'], specs: specs)
      roster.generate
    end
  end
end
