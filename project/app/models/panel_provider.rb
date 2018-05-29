class PanelProvider < ApplicationRecord
  has_many :location_groups
  has_many :locations, through: :location_groups
  has_many :countries

  validates :code, presence: true, uniqueness: true
end
