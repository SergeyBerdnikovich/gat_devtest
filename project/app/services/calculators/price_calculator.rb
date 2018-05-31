# Service for calculating price
#
# @params
#   panel_provider_code [String] PanelProvider code
#
# @return
#   price [Integer, Float] calculated price
#
class Calculators::PriceCalculator
  attr_reader :panel_provider_code
  attr_reader :price

  def initialize(panel_provider_code)
    @panel_provider_code = panel_provider_code
    @data                = nil
    @number              = 0
  end

  def calculate
    fetch_data
    parse_data
    count_elemetns
    count_price
  end

  private

  attr_reader :data, :parsed_data, :number

  def fetch_data
    @data = data_fetcher.fetch_data
  end

  def data_fetcher
    Fetchers::ExternalDataFetcher.new(panel_provider_code)
  end

  def parse_data
    @parsed_data = data_parser.parse(data)
  end

  def data_parser
    Parsers::ExternalDataParser.new(panel_provider_code)
  end

  def count_elemetns
    @number = counter.count
  end

  def counter
    @counter ||= Counters::CounterBuilder.new(panel_provider_code).build(parsed_data)
  end

  def count_price
    @price = number / divider
  end

  def divider
    price_calculation_config['divider']
  end

  def price_calculation_config
    Rails.configuration.price_calculation[panel_provider_code]
  end
end
