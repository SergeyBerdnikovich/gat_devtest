require 'rails_helper'

describe TargetGroupPresenter do
  subject { described_class.new(target_group) }

  describe '#present' do
    let(:target_group) { FactoryBot.create(:target_group) }
    let(:target_group_hash) do
      {
        id:                target_group.id,
        name:              target_group.name,
        external_id:       target_group.external_id,
        parent_id:         target_group.parent_id,
        secret_code:       target_group.secret_code,
        panel_provider_id: target_group.panel_provider_id
      }
    end

    it 'retruns target_group hash' do
      expect(subject.present).to eq(target_group_hash)
    end
  end
end
