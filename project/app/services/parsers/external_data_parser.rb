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
