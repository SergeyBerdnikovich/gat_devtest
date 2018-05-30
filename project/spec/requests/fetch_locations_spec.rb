require 'rails_helper'

describe 'Fetch locations' do
  let!(:country) { FactoryBot.create(:country, :with_locations, code: 'UK', location_count: 2) }
  let(:locations) do
    [
      {
        id:          1,
        name:        'location name #1',
        external_id: '1',
        secret_code: '1'
      },
      {
        id:          2,
        name:        'location name #2',
        external_id: '2',
        secret_code: '2'
      }
    ]
  end

  it 'returns array of hashes of locations in JSON format' do
    get '/api/locations/UK'

    expect(response.body).to eq(locations.to_json)
    expect(response.code).to eq('200')
  end
end
