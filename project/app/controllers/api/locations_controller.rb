class Api::LocationsController < ApplicationController
  # Action for fetching locations
  #
  # [GET]
  #
  # @params
  #   cauntry_code [String] country code
  #
  # @return
  #   locations [JSON] array of hashes of locations
  #
  # @example
  #   [
  #     {
  #       id: 1,
  #       name: 'Minsk',
  #       external_id: 1,
  #       secred_code: 1
  #     },
  #     {
  #       id: 2,
  #       name: 'Kiev',
  #       external_id: 2,
  #       secred_code: 3
  #     }
  #   ]
  #
  def show
    locations = locations_fetcher.fetch_locations

    render json: locations_presenter(locations).present
  end

  private

  def locations_fetcher
    @locations_fetcher ||= Fetchers::LocationsFetcher.new(params[:country_code])
  end

  def locations_presenter(locations)
    LocationsPresenter.new(locations)
  end
end
