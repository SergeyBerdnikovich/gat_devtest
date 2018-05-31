# == Schema Information
#
# Table name: location_groups
#
#  id                :integer          not null, primary key
#  name              :string           not null
#  country_id        :integer          not null
#  panel_provider_id :integer          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class LocationGroup < ApplicationRecord
  has_and_belongs_to_many :locations
  belongs_to :country
  belongs_to :panel_provider

  validates :name,              presence: true
  validates :country_id,        presence: true
  validates :panel_provider_id, presence: true
end
