require 'rails_helper'

describe LocationsPresenter do
  subject { described_class.new(locations) }

  describe '#present' do
    let(:location1) { FactoryBot.create(:location) }
    let(:location2) { FactoryBot.create(:location) }
    let(:locations) { [location1, location2] }
    let(:locations_array) do
      [
        {
          id:          location1.id,
          name:        location1.name,
          external_id: location1.external_id,
          secret_code: location1.secret_code
        },
        {
          id:          location2.id,
          name:        location2.name,
          external_id: location2.external_id,
          secret_code: location2.secret_code
        }
      ]
    end

    it 'retruns locations hash' do
      expect(subject.present).to match_array(locations_array)
    end
  end
end
