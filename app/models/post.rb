class Post < ApplicationRecord
  has_one_attached :image

  validates :title, presence: true, uniqueness: {case_insensitive: true}

  belongs_to :post_category, validate: true

  default_scope {order(created_at: :desc)}
end
