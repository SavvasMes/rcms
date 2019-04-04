class Page < ApplicationRecord
  validates :title, presence: true, uniqueness: {case_insensitive: true}, length: {maximum: 100}
end
