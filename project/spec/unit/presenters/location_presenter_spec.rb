require 'rails_helper'

describe LocationPresenter do
  subject { described_class.new(location) }

  describe '#present' do
    let(:location) { FactoryBot.create(:location) }
    let(:location_hash) do
      {
        id:          location.id,
        name:        location.name,
        external_id: location.external_id,
        secret_code: location.secret_code
      }
    end

    it 'retruns location hash' do
      expect(subject.present).to eq(location_hash)
    end
  end
end
