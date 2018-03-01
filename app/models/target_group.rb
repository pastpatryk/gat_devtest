class TargetGroup < ApplicationRecord

  belongs_to :panel_provider
  belongs_to :parent, class_name: 'TargetGroup'
  has_many :children, class_name: 'TargetGroup', foreign_key: 'parent_id'
  has_and_belongs_to_many :countries

  validates :name, :external_id, :secret_code, presence: true
  validates :panel_provider, presence: true, unless: :parent?

  scope :root_nodes, -> { where(parent_id: nil) }

end
