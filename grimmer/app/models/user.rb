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

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.nickname = auth.info.name
      user.password = '123456789'
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
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