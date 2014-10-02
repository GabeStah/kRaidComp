class ClassSpec < ActiveRecord::Base
  belongs_to :character_class
  has_and_belongs_to_many :spells

  validates_uniqueness_of :name, case_sensitive: false, scope: :character_class
end
