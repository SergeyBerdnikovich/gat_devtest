require 'rails_helper'

describe Counters::LetterCounter do
  subject { described_class.new(data) }

  describe '#count' do
    let(:data) { 'afsfsdfjshdkjfhsdkj sdf sdf dsa fsdfsdf a sdf 12312fsdf dsf/afsdf29138kjfds fjhsd' }

    it 'returns number of letter "a"' do
      expect(subject.count).to eq(4)
    end
  end
end
