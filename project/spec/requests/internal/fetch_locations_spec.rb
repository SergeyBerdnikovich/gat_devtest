require 'rails_helper'

describe 'Fetch locations' do
  let!(:country)  { FactoryBot.create(:country, :with_locations, code: 'UK', location_count: 2) }
  let(:location1) { country.locations.first }
  let(:location2) { country.locations.last }
  let(:locations) do
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

  it 'returns array of hashes of locations in JSON format' do
    get '/api/internal/locations/UK'

    expect(response.body).to eq(locations.to_json)
    expect(response.code).to eq('200')
  end
end
