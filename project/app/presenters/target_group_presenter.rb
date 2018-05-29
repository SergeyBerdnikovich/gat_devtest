class TargetGroupPresenter
  attr_reader :target_group

  def initialize(target_group)
    @target_group = target_group
  end

  def present
    {
      id:                target_group.id,
      name:              target_group.name,
      external_id:       target_group.external_id,
      parent_id:         target_group.parent_id,
      secret_code:       target_group.secret_code,
      panel_provider_id: target_group.panel_provider_id
    }
  end
end
