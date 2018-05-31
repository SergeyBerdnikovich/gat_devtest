# == Schema Information
#
# Table name: target_groups
#
#  id                :integer          not null, primary key
#  name              :string           not null
#  secret_code       :string
#  external_id       :integer
#  parent_id         :integer
#  panel_provider_id :integer          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class TargetGroup < ActiveRecord::Base
  belongs_to :panel_provider
  belongs_to :parent_node, class_name: 'TargetGroup', foreign_key: :parent_id, required: false
  has_many :child_nodes, class_name: 'TargetGroup', foreign_key: :parent_id
  has_and_belongs_to_many :countries

  scope :root_nodes, -> { where(parent_id: nil) }
end
