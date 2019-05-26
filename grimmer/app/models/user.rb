class User < ApplicationRecord
  has_many :posts
  has_many :posts, :through => :user_profiles
  has_many :upvotes , dependent: :destroy
  has_many :downvotes, dependent: :destroy
  has_one_attached :photo
  validates :name, presence: true
  validates :password, length: { in: 6..15}, presence: true
  validates :nickname, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}



end