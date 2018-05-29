class TargetGroup < ActiveRecord::Base
  belongs_to :panel_provider
  belongs_to :parent_node, class_name: 'TargetGroup', foreign_key: :parent_id, required: false
  has_many :child_nodes, class_name: 'TargetGroup', foreign_key: :parent_id
  has_and_belongs_to_many :countries

  scope :root_nodes, -> { where(parent_id: nil) }
end
