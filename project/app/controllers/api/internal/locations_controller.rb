# Controller for handling locations
#
# Inherits the show action from public controller
#
# Show - Action for fetching locations
#
# [GET]
#
# @params
#   cauntry_code [String] country code
#
# @authentication
#   basic-authenication - the credentials are located in clonfig/http_authentication.yml
#   Should be used through HTTPS
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
class Api::Internal::LocationsController < Api::LocationsController
  include HttpAuthentication
end
