class Api::TargetGroupsController < ApplicationController
  # Action for fetching target groups
  #
  # [GET]
  #
  # @params
  #   cauntry_code [String] country code
  #
  # @return
  #   target_groups [JSON] array of hashes of targat groups
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
