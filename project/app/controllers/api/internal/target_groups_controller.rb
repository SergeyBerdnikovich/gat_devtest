# Controller for handling target groups
#
# Inherits the show action from public controller
#
# Show - Action for fetching target groups
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
class Api::Internal::TargetGroupsController < Api::TargetGroupsController
  include HttpAuthentication
end
