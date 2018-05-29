class Country < ApplicationRecord
  belongs_to :panel_provider
  has_many :country_groups

  validates :code,           presence: true, uniqueness: true
  validates :panel_provider, presence: true

  has_many :locations, through: :panel_provider
end
