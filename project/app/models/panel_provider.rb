# == Schema Information
#
# Table name: panel_providers
#
#  id         :integer          not null, primary key
#  code       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PanelProvider < ApplicationRecord
  has_many :location_groups
  has_many :locations, through: :location_groups
  has_many :countries
  has_many :target_groups

  validates :code, presence: true, uniqueness: true
end
