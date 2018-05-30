require 'rails_helper'

describe 'Fetch target groups' do
  let!(:country)      { FactoryBot.create(:country, :with_target_groups, code: 'UK', child_nodes_count: 1) }
  let(:target_group1) { country.target_groups.first }
  let(:target_group2) { country.target_groups.last }
  let(:target_groups) do
    [
      {
        id:                target_group1.id,
        name:              target_group1.name,
        external_id:       target_group1.external_id,
        parent_id:         target_group1.parent_id,
        secret_code:       target_group1.secret_code,
        panel_provider_id: target_group1.panel_provider_id
      },
      {
        id:                target_group2.id,
        name:              target_group2.name,
        external_id:       target_group2.external_id,
        parent_id:         target_group2.parent_id,
        secret_code:       target_group2.secret_code,
        panel_provider_id: target_group2.panel_provider_id
      }
    ]
  end

  it 'returns array of hashes of target_groups in JSON format' do
    get '/api/internal/target_groups/UK'

    expect(response.body).to eq(target_groups.to_json)
    expect(response.code).to eq('200')
  end
end
