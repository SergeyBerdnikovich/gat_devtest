require 'rails_helper'

describe Counters::CounterBuilder do
  subject { described_class.new(panel_provider_code) }

  describe '#build' do
    let(:data) { 'data' }

    context 'when there is "times_a" code' do
      let(:panel_provider_code) { 'times_a' }

      it 'returns counter object' do
        expect(subject.build(data)).to be_an_instance_of(Counters::LetterCounter)
      end
    end

    context 'when there is "10_arrays" code' do
      let(:panel_provider_code) { '10_arrays' }

      it 'returns counter object' do
        expect(subject.build(data)).to be_an_instance_of(Counters::ArrayCounter)
      end
    end

    context 'when there is "times_html" code' do
      let(:panel_provider_code) { 'times_html' }

      it 'returns counter object' do
        expect(subject.build(data)).to be_an_instance_of(Counters::NodesCounter)
      end
    end
  end
end
