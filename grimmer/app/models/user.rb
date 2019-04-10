class User < ApplicationRecord
  has_many :posts
  has_many :posts, :through => :user_profiles
  validates :name, presence: true
  validates :password, length: { in: 6..15}, presence: true
  validates :nickname, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  #validates :country, allow_nil: true
  #validates :country, :allow_blank: true
  #validates :biography, allow_blank: true
end
