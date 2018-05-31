# Service for building counter dependent on panel provider code
#
# @params
#   panel_provider_code [String] PanelProvider code
#
# @return
#   counter [Counters::ArrayCounter, Counters::LetterCounter, Counters::NodesCounter] instance of counter
#
class Counters::CounterBuilder
  attr_reader :panel_provider_code
  attr_reader :counter

  def initialize(panel_provider_code)
    @panel_provider_code = panel_provider_code
  end

  def build(data)
    @counter = counter_class.new(data)
  end

  private

  def counter_class
    price_calculation_config['counter_class'].constantize
  end

  def price_calculation_config
    Rails.configuration.price_calculation[panel_provider_code]
  end
end
