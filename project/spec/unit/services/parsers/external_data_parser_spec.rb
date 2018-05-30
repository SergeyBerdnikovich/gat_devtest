require 'rails_helper'

describe Parsers::ExternalDataParser do
  subject { described_class.new(panel_provider_code) }

  describe '#parse' do
    context 'when there is "times_a" panel provider' do
      let(:panel_provider_code) { 'times_a' }
      let(:data)                { '123a' }
      let(:parsed_data)         { data }

      it 'parses string' do
        expect(subject.parse(data)).to eq(parsed_data)
      end
    end

    context 'when there is "10_arrays" panel provider' do
      let(:panel_provider_code) { '10_arrays' }
      let(:data)                { '{"a":1,"b":2}' }
      let(:parsed_data)         { { 'a' => 1, 'b' => 2 } }

      it 'parses json' do
        expect(subject.parse(data)).to eq(parsed_data)
      end
    end

    context 'when there is "times_html" panel provider' do
      let(:panel_provider_code) { 'times_html' }
      let(:data)                { '<h1>Hello World!</h1>' }
      let(:parsed_data)         { data }

      it 'parses string' do
        expect(subject.parse(data)).to eq(parsed_data)
      end
    end
  end
end
