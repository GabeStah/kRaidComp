class Roster
  extend ActiveModel::Callbacks
  include ActiveModel::Validations

  define_model_callbacks :initialize, only: :after

  after_initialize :convert_numbers
  after_initialize :generate
  after_initialize :calculate_coverage

  validates :duplicates_allowed,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 50 }
  validates :max_size,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 50 }

  attr_accessor :duplicates_allowed, :class_specs, :effects, :spec_ids, :max_size, :specs

  def calculate_coverage
    @effects = Array.new
    specs.each do |spec|
      # Repeat count times
      spec.count.times do
        # Get spells
        spec.class_spec.spells.each do |spell|
          # Get effects
          spell.effects.each do |effect|
            @effects << effect.name
          end
        end
      end
    end
    @effects = @effects.sort
  end

  def initialize(attributes = {})
    run_callbacks :initialize do
      @duplicates_allowed = attributes[:duplicates_allowed] || 0
      @attributes = attributes
      @class_specs = attributes[:class_specs]
      @max_size = attributes[:max_size] || 25
      @specs ||= Array.new
      @specs = attributes[:specs] if attributes[:specs]
    end
  end

  def generate
    if @class_specs
      @class_specs = @class_specs.shuffle
      count = rand(0..(@max_size - self.size))
      @class_specs.each do |class_spec|
        count = rand(0..(@duplicates_allowed - spec_count(class_spec.id))) if @duplicates_allowed > 0
        # set count if adding would exceed max
        count = @max_size - self.size if (self.size + count) > @max_size
        # Update
        spec_update(class_spec, count)
      end
    end
    # Remove empty specs
    specs.delete_if { |spec| spec.count == 0 }
    # Create ids array
    @spec_ids = Array.new
    specs.each do |spec|
      spec.count.times do
        @spec_ids << spec.class_spec.id
      end
    end
    # Sort
    @spec_ids = @spec_ids.sort
  end

  def size
    count = 0
    specs.each do |spec|
      count += spec.count
    end
    count
  end

  def spec_count(spec_id)
    if @specs
      @specs.each do |spec|
        if spec.class_spec.id == spec_id
          return spec.count
        end
      end
    end
    0
  end

  def spec_update(class_spec, count)
    found = false
    if @specs
      # Update
      @specs.each do |spec|
        if spec.class_spec.id == class_spec.id
          spec.count = count
          found = true
        end
      end
    end
    if !found
      # Add new
      self.specs << Spec.new(class_spec: class_spec, count: count)
    end
  end

  private

  def convert_numbers
    @duplicates_allowed = @duplicates_allowed.to_i
    @max_size = @max_size.to_i
  end
end