require 'rails_helper'

describe Counters::NodesCounter do
  subject { described_class.new(data) }

  describe '#count' do
    let(:data) { "<html><head></head><body><h1>Hello world!</h1><br><img src='/gat.jpg'></body></html>" }

    it 'returns number of html nodes' do
      expect(subject.count).to eq(6)
    end
  end
end
