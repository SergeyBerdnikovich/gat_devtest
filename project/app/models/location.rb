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

class Location < ApplicationRecord
  has_and_belongs_to_many :location_groups

  validates :name,        presence: true
  validates :external_id, presence: true, uniqueness: true
  validates :secret_code, presence: true
end
