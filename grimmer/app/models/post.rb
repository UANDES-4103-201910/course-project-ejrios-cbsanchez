class Post < ApplicationRecord
  belongs_to :user
  has_many :commentaries
  has_many :upvotes , dependent: :destroy
  has_many :downvotes, dependent: :destroy
  has_many :inappropiates, dependent: :destroy
  has_one_attached :photo
  has_one_attached :file
  validates :title, presence: true
  validates :description, presence: true
  validates :type_of_post, presence: true

  before_validation :ensure_post_have_description

  private
  def ensure_post_have_description
    if description.blank?
      self.description = title unless title.blank?
    end
  end
end
