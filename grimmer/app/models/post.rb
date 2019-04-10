class Post < ApplicationRecord
  belongs_to :user
  has_many :commentaries
  validates :title, presence: true
  validates :description, presence: true
  validates :type, presence: true

  before_validation :ensure_post_have_description

  private
  def ensure_post_have_description
    if description.blank?
      self.description = title unless title.blank?
    end
  end
end
