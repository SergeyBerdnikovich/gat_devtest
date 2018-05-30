require 'rails_helper'

describe Fetchers::ExternalDataFetcher do
  subject { described_class.new(panel_provider_code) }

  describe '#fetch_data' do
    let(:panel_provider_code) { 'times_a' }

    context 'when fetching data is successful' do
      let(:data)     { 'data' }
      let(:response) { double(:response, body: data) }

      before do
        allow(RestClient).to receive(:get).and_return(response)
      end

      it 'returns data' do
        expect(subject.fetch_data).to eq(data)
      end
    end

    context 'when fetching data is not successful' do
      before do
        allow(RestClient).to receive(:get).and_raise(StandardError)
      end

      it 'returns nil' do
        expect(subject.fetch_data).to be nil
      end
    end
  end
end
