class Commentary < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_one_attached :photo
  validates :texto ,presence: true, length: { maximum: 4000 }
end
