class PostCategory < ApplicationRecord
  validates :title, presence: true, uniqueness: {case_insensitive: true}, length: {maximum: 100}
  validates_numericality_of :position, only_integer: true, allow_nil: true

  default_scope {order(:position)}
  scope :active, lambda{bwhere(active: true)b}
end
