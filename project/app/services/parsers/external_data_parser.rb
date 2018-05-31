# Service for parsing external data
#
# Dependent on different panel providers codes it can parse data from JSON or return raw string.
#
# Mapping code -> parser is located in config/price_calculation.yml
#
# @params
#   panel_provider_code - [String] PanelProvider code
#
# @return
#   parsed_data [String] parsed data
#
class Parsers::ExternalDataParser
  attr_reader :panel_provider_code
  attr_reader :parsed_data

  def initialize(panel_provider_code)
    @panel_provider_code = panel_provider_code
  end

  def parse(data)
    case price_calculation_config['target_type']
    when 'string'
      data.to_s
    when 'json'
      JSON.parse(data)
    end
  end

  private

  def price_calculation_config
    Rails.configuration.price_calculation[panel_provider_code]
  end
end
