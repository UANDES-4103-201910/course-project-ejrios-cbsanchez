class User < ApplicationRecord
  has_many :posts
  has_many :posts, :through => :user_profiles
  has_one_attached :photo
  validates :name, presence: true
  validates :password, length: { in: 6..15}, presence: true
  validates :nickname, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}
  attr_accessor :remember_token, :reset_token

  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now

  end

  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  class << self

    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                 BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    def new_token
      SecureRandom.urlsafe_base64
    end

  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

end