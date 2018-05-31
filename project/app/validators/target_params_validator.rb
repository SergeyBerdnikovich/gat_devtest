# Service object for validating params
#
# @params
#   hash of data [Hash] data which should be validated
#     country_code [String] country code                       - (mandatory) (can be UK, US or PL)
#     target_group_id [String, Integer] target group id        - (mandatory)
#     locations [Array<Hash>] array of hashes of location data - (mandatory)
#       location [Hash] location data
#         id [String, Integer] location id
#         panel_size [String, Integer] panel size
#
#  @return
#    true/false [TrueClass, FalseClass] validation mark
#
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
