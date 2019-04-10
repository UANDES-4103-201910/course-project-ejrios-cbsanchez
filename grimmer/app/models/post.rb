class Post < ApplicationRecord
  belongs_to :user
  has_many :commentaries
  validates :title, presence: true
  validates :description, presence: true
  validates :type, presence: true
  validates :country, allow_blank: true
  validates :city, allow_blank: true
end
