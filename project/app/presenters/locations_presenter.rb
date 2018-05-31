# Representer for collection of locations
#
# @params
#   locations [Array<Location>] array of location
#
# @return
#   represented locations [Array<Hash>] array of represented locations
#
# @example
#   [
#     {
#       id: 1,
#       name: 'Minsk',
#       external_id: 1,
#       secred_code: 1
#     },
#     {
#       id: 2,
#       name: 'Kiev',
#       external_id: 2,
#       secred_code: 3
#     }
#   ]
#
class LocationsPresenter
  attr_reader :locations

  def initialize(locations)
    @locations = locations
  end

  def present
    locations.map do |location|
      location_presenter(location).present
    end
  end

  private

  def location_presenter(location)
    LocationPresenter.new(location)
  end
end
