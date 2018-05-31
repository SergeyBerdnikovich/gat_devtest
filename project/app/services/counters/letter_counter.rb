# Service for counting letter 'a'
#
# @params
#   data [String] data which can contains letter 'a'
#
# @return
#   number [Integer] number of latter 'a' in the data
#
class Counters::LetterCounter
  LETTER = 'a'.freeze

  attr_reader :data
  attr_reader :number

  def initialize(data)
    @data   = data
    @number = 0
  end

  def count
    @number = data.count(LETTER)
  end
end
