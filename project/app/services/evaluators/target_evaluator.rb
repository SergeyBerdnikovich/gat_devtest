# Service for evaluating targe
#
# @params
#   params [Hash] hash of data
#     country_code [String] country code
#     target_group_id [String, Integer] target group id          - not used in service now
#     locations [Array<Hash>] array of hashes with location data - not used in service now
#       id [String, Integer] location id
#       panel_size [String, Integer] panel size
#
# @return
#   price [Integer, Float] calculated price
#
class Evaluators::TargetEvaluator
  attr_reader :params
  attr_reader :price

  def initialize(params)
    @params = params
  end

  def evaluate
    fetch_country
    fetch_panel_provider_code
    calculate_price
  end

  private

  attr_reader :country, :panel_provider_code

  def fetch_country
    @country = Country.find_by(code: params[:country_code])
  end

  def fetch_panel_provider_code
    @panel_provider_code = country.panel_provider.code
  end

  def calculate_price
    @price = price_calculator.calculate
  end

  def price_calculator
    Calculators::PriceCalculator.new(panel_provider_code)
  end
end
