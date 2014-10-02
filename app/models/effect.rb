class Effect < ActiveRecord::Base
  has_and_belongs_to_many :spells, -> { uniq }

  validates :name,
            presence: true,
            uniqueness: { case_sensitive: false }
end
