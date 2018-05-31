# Presenter for representing target froup object
#
# @params
#   target_group [TargetGroup] target group
#
# @return
#   attributes [Hash] represented target_group
#
# @example
#   {
#     id: 1,
#     name: 'Group A',
#     external_id: 1,
#     parent_id: nil,
#     secred_code: 1
#     panel_provider_id: 1
#   }
#
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
