# Service for counting arrays with 10 or more elements
#
# @params
#   data [Array, Hash] data wich contains arrays
#
# @return
#   number [integer] number of arrays with 10 or more elements
#
class Counters::ArrayCounter
  ELEMENTS_AMOUNT = 10

  attr_reader :data
  attr_reader :number

  def initialize(data)
    @data   = data
    @number = 0
  end

  def count
    count_arrays(data)

    number
  end

  private

  attr_writer :number

  def count_arrays(data)
    case data
    when Array
      self.number += 1 if data.size >= ELEMENTS_AMOUNT

      data.each { |element| count_arrays(element) }
    when Hash
      data.each { |_, value| count_arrays(value) }
    end
  end
end
