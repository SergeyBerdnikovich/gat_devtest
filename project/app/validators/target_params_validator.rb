class TargetParamsValidator
  MANDATORY_LOCATION_KEYS = %i(id panel_size).freeze

  include ActiveModel::Model

  attr_accessor :country_code, :target_group_id, :locations

  validates :country_code,    presence: true, inclusion: { in: %w(PL UK US) }
  validates :target_group_id, presence: true
  validates :locations,       presence: true

  validate :locations_structure

  private

  def locations_structure
    return if locations.blank?

    errors.add(:locations, 'have invalid structure!') if invalid_locations_structure?
  end

  def invalid_locations_structure?
    return true unless locations.is_a?(Array)
    return true unless locations.all? { |location| valid_location?(location) }
  end

  def valid_location?(location)
    location.is_a?(Hash) && MANDATORY_LOCATION_KEYS.all? { |key| location.has_key?(key) }
  end
end
