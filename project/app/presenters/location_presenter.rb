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
