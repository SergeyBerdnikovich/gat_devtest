require 'rails_helper'

describe TargetGroupsPresenter do
  subject { described_class.new(target_groups) }

  describe '#present' do
    let(:target_group1) { FactoryBot.create(:target_group, :with_child_nodes, child_nodes_count: 1) }
    let(:target_group2) { FactoryBot.create(:target_group) }
    let(:target_groups) { [target_group1, target_group2, target_group1.child_nodes.first] }
    let(:target_groups_array) do
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
        },
        {
          id:                target_group1.child_nodes.first.id,
          name:              target_group1.child_nodes.first.name,
          external_id:       target_group1.child_nodes.first.external_id,
          parent_id:         target_group1.child_nodes.first.parent_id,
          secret_code:       target_group1.child_nodes.first.secret_code,
          panel_provider_id: target_group1.child_nodes.first.panel_provider_id
        }
      ]
    end

    it 'retruns target groups array' do
      expect(subject.present).to match_array(target_groups_array)
    end
  end
end
