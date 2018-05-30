class Api::LocationsController < ApplicationController
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
