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
