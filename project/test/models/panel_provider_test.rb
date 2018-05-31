# == Schema Information
#
# Table name: panel_providers
#
#  id         :integer          not null, primary key
#  code       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "test_helper"

class PanelProviderTest < ActiveSupport::TestCase
  test "duplicate codes are not allowed" do
    already_defined_code = PanelProvider.first.code

    assert_raises ActiveRecord::RecordInvalid do
      PanelProvider.create!(code: already_defined_code)
    end
  end
end
