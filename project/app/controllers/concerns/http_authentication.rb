# Concern for adding Basic Authentication (need to use over HTTPS).
#
module HttpAuthentication
  extend ActiveSupport::Concern

  included do
    before_action :http_authenticate
  end

  def http_authenticate
    return true if Rails.env == 'test'

    authenticate_or_request_with_http_basic do |username, password|
      username == http_authentication_config['username'] && password == http_authentication_config['password']
    end
  end

  private

  def http_authentication_config
    Rails.configuration.http_authentication
  end
end
