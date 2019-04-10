class Commentary < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :texto ,presence: true, length: { maximum: 4000 }
end
