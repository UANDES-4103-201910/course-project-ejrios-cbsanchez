class Commentary < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :texto ,presence: true, length: { maximum: 4000 }
  validates :city, allow_blank: true
  validates :country, allow_blank: true
end
