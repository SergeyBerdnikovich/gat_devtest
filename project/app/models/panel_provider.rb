class PanelProvider < ApplicationRecord
  has_many :location_groups
  has_many :locations, through: :location_groups
  has_many :countries
  has_many :target_groups

  validates :code, presence: true, uniqueness: true
end
