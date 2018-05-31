# == Schema Information
#
# Table name: countries
#
#  id                :integer          not null, primary key
#  code              :string           not null
#  panel_provider_id :integer          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Country < ApplicationRecord
  belongs_to :panel_provider
  has_many :country_groups
  has_and_belongs_to_many :target_groups, -> { where(parent_id: nil) }

  validates :code,           presence: true, uniqueness: true
  validates :panel_provider, presence: true

  has_many :locations, through: :panel_provider
  has_many :target_groups, through: :panel_provider
end
