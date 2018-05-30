require 'rails_helper'

describe 'Evaluate Targets', :vcr do
  context 'when UK panel provider' do
    let!(:country)       { FactoryBot.create(:country, code: 'UK', panel_provider: panel_provider) }
    let(:panel_provider) { FactoryBot.create(:panel_provider, code: 'times_html') }

    context 'when params are valid' do
      let(:params) do
        {
          country_code: 'UK',
          target_group_id: 1,
          locations: [
            {
              id: 1, panel_size: 10
            }
          ]
        }
      end
      let(:result_hash) { { price: 9.72 } }

      it 'returns success result hash' do
        post '/api/internal/evaluate_target', params: params

        expect(response.body).to eq(result_hash.to_json)
        expect(response.code).to eq('200')
      end
    end

    context 'when params are not valid' do
      let(:params) do
        {
          country_code: 'BY',
          target_group_id: 1,
          locations: [
            {
              id: 1, panel_size: 10
            }
          ]
        }
      end
      let(:result_hash) { { errors: 'Country code is not included in the list' } }

      it 'returns success result hash' do
        post '/api/internal/evaluate_target', params: params

        expect(response.body).to eq(result_hash.to_json)
        expect(response.code).to eq('200')
      end
    end
  end

  context 'when US panel provider' do
    let!(:country)       { FactoryBot.create(:country, code: 'US', panel_provider: panel_provider) }
    let(:panel_provider) { FactoryBot.create(:panel_provider, code: '10_arrays') }

    context 'when params are valid' do
      let(:params) do
        {
          country_code: 'US',
          target_group_id: 1,
          locations: [
            {
              id: 1, panel_size: 10
            }
          ]
        }
      end
      let(:result_hash) { { price: 118 } }

      it 'returns success result hash' do
        post '/api/internal/evaluate_target', params: params

        expect(response.body).to eq(result_hash.to_json)
        expect(response.code).to eq('200')
      end
    end
  end

  context 'when PL panel provider' do
    let!(:country)       { FactoryBot.create(:country, code: 'PL', panel_provider: panel_provider) }
    let(:panel_provider) { FactoryBot.create(:panel_provider, code: 'times_a') }

    context 'when params are valid' do
      let(:params) do
        {
          country_code: 'PL',
          target_group_id: 1,
          locations: [
            {
              id: 1, panel_size: 10
            }
          ]
        }
      end
      let(:result_hash) { { price: 49.13 } }

      it 'returns success result hash' do
        post '/api/internal/evaluate_target', params: params

        expect(response.body).to eq(result_hash.to_json)
        expect(response.code).to eq('200')
      end
    end
  end
end
