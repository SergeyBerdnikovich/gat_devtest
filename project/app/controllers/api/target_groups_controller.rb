class Api::TargetGroupsController < ApplicationController
  def show
    target_groups = target_groups_fetcher.fetch_target_groups

    render json: target_groups_presenter(target_groups).present
  end

  private

  def target_groups_fetcher
    @target_groups_fetcher ||= Fetchers::TargetGroupsFetcher.new(params[:country_code])
  end

  def target_groups_presenter(target_groups)
    TargetGroupsPresenter.new(target_groups)
  end
end
