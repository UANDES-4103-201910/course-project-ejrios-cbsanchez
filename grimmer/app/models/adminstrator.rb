class Adminstrator < ApplicationRecord
  validates :name, presence: true
  validates :password, length: { in: 6..15}, presence: true
  validates :nickname, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}
end
