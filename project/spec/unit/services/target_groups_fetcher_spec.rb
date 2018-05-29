require 'rails_helper'

describe TargetGroupsFetcher do
  subject { described_class.new(country_code) }

  describe '#fetch_target_groups' do
    let(:country_code) { 'UK' }

    context 'when country_code is correct' do
      let!(:country) { FactoryBot.create(:country, :with_target_groups, code: country_code) }

      it 'fetches the country' do
        expect(subject).to receive(:fetch_country).and_return(country)

        subject.fetch_target_groups
      end

      it 'returns target_groups' do
        expect(subject.fetch_target_groups).to match_array(country.target_groups)
      end
    end

    context 'when country_code is not correct' do
      it 'does not fetch the country' do
        expect(subject).to receive(:fetch_country).and_return(nil)

        subject.fetch_target_groups
      end

      it 'returns empty array' do
        expect(subject.fetch_target_groups).to eq([])
      end
    end
  end
end
