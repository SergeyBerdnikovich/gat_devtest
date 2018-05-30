require 'rails_helper'

describe Fetchers::LocationsFetcher do
  subject { described_class.new(country_code) }

  describe '#fetch_locations' do
    let(:country_code) { 'UK' }

    context 'when country_code is correct' do
      let!(:country) { FactoryBot.create(:country, :with_locations, code: country_code) }

      it 'fetches the country' do
        expect(subject).to receive(:fetch_country).and_return(country)

        subject.fetch_locations
      end

      it 'returns locations' do
        expect(subject.fetch_locations).to match_array(country.locations)
      end
    end

    context 'when country_code is not correct' do
      it 'does not fetch the country' do
        expect(subject).to receive(:fetch_country).and_return(nil)

        subject.fetch_locations
      end

      it 'returns empty array' do
        expect(subject.fetch_locations).to eq([])
      end
    end
  end
end
