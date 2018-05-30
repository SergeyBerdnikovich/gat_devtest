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
