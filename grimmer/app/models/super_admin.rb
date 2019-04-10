class SuperAdmin < ApplicationRecord
  validates :name, presence: true
  validates :password, length: { in: 6..15}, presence: true
  validates :nickname, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :e_password, uniqueness: true, presence: true
end
