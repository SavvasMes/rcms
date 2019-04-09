class Page < ApplicationRecord
  before_save :alter_homepage, if: lambda{self.home_page}

  validates :title, presence: true, uniqueness: {case_insensitive: true}, length: {maximum: 100}

  validate :validate_homepages_draft


  private
  def validate_homepages_draft
    if self.home_page && self.draft
      errors.add :home_page, " can't be draft!"
    end
  end

  def alter_homepage
    pages = Page.where(home_page: true)
    if self.persisted?
    pages = pages.where.not("id = #{self.id}")
    end
    pages.update_all home_page: false
  end
end
