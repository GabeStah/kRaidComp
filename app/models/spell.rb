class Spell < ActiveRecord::Base
  has_and_belongs_to_many :effects
  has_and_belongs_to_many :class_specs
end
