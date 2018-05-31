# Representer for collection of target groups
#
# @params
#   locations [Array<TargetGroup>] array of target groups
#
# @return
#   represented target groups [Array<Hash>] array of represented target groups
#
# @example
#   [
#     {
#       id: 1,
#       name: 'Group A',
#       external_id: 1,
#       parent_id: nil,
#       secred_code: 1
#       panel_provider_id: 1
#     },
#     {
#       id: 2,
#       name: 'Group A/B',
#       external_id: nil,
#       parent_id: 1,
#       secred_code: nil
#       panel_provider_id: 1
#     },
#   ]
#
class TargetGroupsPresenter
  attr_reader :target_groups

  def initialize(target_groups)
    @target_groups = target_groups
  end

  def present
    target_groups.map do |target_group|
      target_group_presenter(target_group).present
    end
  end

  private

  def target_group_presenter(target_group)
    TargetGroupPresenter.new(target_group)
  end
end
