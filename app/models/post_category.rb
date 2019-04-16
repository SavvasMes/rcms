class PostCategory < ApplicationRecord
  validates :tittle, presence: true, uniqueness: {case_insensitive: true}, length: {maximum: 100}
  validates_numericality_of :position, only_integer: true, allow_nil: true

  has_many :posts, dependent: :destroy

  default_scope {order(:position)}
  scope :active, lambda{bwhere(active: true)}
end
