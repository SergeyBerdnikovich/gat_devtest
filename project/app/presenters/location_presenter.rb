# Presenter for representing location object
#
# @params
#   location [Location] location
#
# @return
#   attributes [Hash] represented location
#
# @example
#   {
#     id: 1,
#     name: 'Minsk',
#     external_id: 1,
#     secred_code: 1
#   }
#
class LocationPresenter
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def present
    {
      id:          location.id,
      name:        location.name,
      external_id: location.external_id,
      secret_code: location.secret_code
    }
  end
end
