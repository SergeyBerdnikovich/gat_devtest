# Service for counting nodes in html
#
# @params
#   data [String] html
#
# @return
#   number [Integer] number of nodes in html
#
class Counters::NodesCounter
  PATTERN = /(<\/.+?>|<br>|<[^<]*\/>|<hr>|<img[^<]*>)/.freeze

  attr_reader :data
  attr_reader :number

  def initialize(data)
    @data   = data
    @number = 0
  end

  def count
    @number = data.scan(PATTERN).count
  end
end
