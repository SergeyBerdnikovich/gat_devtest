# == Schema Information
#
# Table name: locations
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  external_id :string           not null
#  secret_code :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require "test_helper"

class LocationTest < ActiveSupport::TestCase
end
