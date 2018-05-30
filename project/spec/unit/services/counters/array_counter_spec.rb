require 'rails_helper'

describe Counters::ArrayCounter do
  subject { described_class.new(data) }

  describe '#count' do
    let(:data) do
      {
        a: 1,
        s: '1',
        d: [1, 2, 3],
        f: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
        g: {
          a: 1,
          b: [1, 2, { a: 1 }, {s: 2}],
          c: [1, 2, [1, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]]]
        },
        [1, 2] => {
          a: 1,
          s: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        }
      }
    end

    it 'returns number of arrays with 10 or more elements' do
      expect(subject.count).to eq(3)
    end
  end
end
