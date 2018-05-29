class TargetGroupsFetcher
  attr_reader :country_code
  attr_reader :target_groups

  def initialize(country_code)
    @country_code = country_code
  end

  def fetch_target_groups
    fetch_country
    _fetch_target_groups
  end

  private

  attr_reader :country

  def fetch_country
    @country = Country.find_by(code: country_code)
  end

  def _fetch_target_groups
    @target_groups = if country.blank?
                   []
                 else
                   country.target_groups
                 end
  end
end
