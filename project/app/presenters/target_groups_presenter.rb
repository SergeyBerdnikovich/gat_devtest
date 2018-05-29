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
