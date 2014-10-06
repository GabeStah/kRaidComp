class Generator
  extend ActiveModel::Callbacks
  include ActiveModel::Validations

  define_model_callbacks :initialize, only: :after

  after_initialize :generate_rosters

  validates :duplicates_allowed,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 50 }
  validates :roster_size,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 50 }

  attr_accessor :duplicates_allowed, :initial_roster, :rosters, :roster_size

  def initialize(attributes = {})
    run_callbacks :initialize do
      @attributes = attributes
      @duplicates_allowed = attributes[:duplicates_allowed] || 0
      @initial_roster = attributes[:initial_roster]
      @roster_size = attributes[:roster_size] || 25
    end
  end

  private

  def generate_rosters
    blah = true

  end
end