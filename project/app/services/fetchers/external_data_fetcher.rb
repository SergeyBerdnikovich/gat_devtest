require 'rest-client'

# Service for fetching data from external storage(host in our case)
#
# The data are fetched through http GET request
#
# Dependent on deifferent panel providers codes it can fetch data from different hosts
#
# Mapping code -> url is located in config/price_calculation.yml
#
# @params
#   panel_provider_code - [String] PanelProvider code
#
# @return
#   data [String] raw data
#
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
