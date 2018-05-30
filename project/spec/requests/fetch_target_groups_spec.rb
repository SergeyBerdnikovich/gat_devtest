require 'rails_helper'

describe 'Fetch target groups' do
  let!(:country) { FactoryBot.create(:country, :with_target_groups, code: 'UK', child_nodes_count: 1) }
  let(:target_groups) do
    [
      {
        id:                1,
        name:              'target group name #1',
        external_id:       1,
        parent_id:         nil,
        secret_code:       '1',
        panel_provider_id: 1
      },
      {
        id:                2,
        name:              'target group name #2',
        external_id:       1,
        parent_id:         1,
        secret_code:       '1',
        panel_provider_id: 1
      }
    ]
  end

  it 'returns array of hashes of target_groups in JSON format' do
    get '/api/target_groups/UK'

    expect(response.body).to eq(target_groups.to_json)
    expect(response.code).to eq('200')
  end
end
