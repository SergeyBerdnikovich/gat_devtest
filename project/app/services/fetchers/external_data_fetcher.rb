require 'rest-client'

class Fetchers::ExternalDataFetcher
  attr_reader :panel_provider_code

  def initialize(panel_provider_code)
    @panel_provider_code = panel_provider_code
  end

  def fetch_data
    RestClient.get(target_url).body
  rescue
    nil
  end

  private

  def target_url
    price_calculation_config['target_url']
  end

  def price_calculation_config
    Rails.configuration.price_calculation[panel_provider_code]
  end
end
