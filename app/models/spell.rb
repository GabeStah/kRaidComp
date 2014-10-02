class Spell < ActiveRecord::Base
  has_and_belongs_to_many :effects, -> { uniq }
  has_and_belongs_to_many :class_specs

end
