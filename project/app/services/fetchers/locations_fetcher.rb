# Service for fetching locations
#
# @params
#   country_code [String] country code
#
# @return
#   location [Array] array of unique locations - can be empty
#
class Fetchers::LocationsFetcher
  attr_reader :country_code
  attr_reader :locations

  def initialize(country_code)
    @country_code = country_code
  end

  def fetch_locations
    fetch_country
    fetch_uniq_country_locations
  end

  private

  attr_reader :country

  def fetch_country
    @country = Country.find_by(code: country_code)
  end

  def fetch_uniq_country_locations
    @locations = if country.blank?
                   []
                 else
                   country.locations.uniq
                 end
  end
end
