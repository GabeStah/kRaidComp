class ClassSpec < ActiveRecord::Base
  belongs_to :character_class
  has_and_belongs_to_many :spells
end
