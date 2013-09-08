class User < ActiveRecord::Base
  attr_accessible :email, :firstname, :lastname, :password_digest, :user_type
  has_many :messages   ,  dependent:   :destroy

  before_save { self.email = email.downcase }
  validates :firstname, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
            format:     { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  has_secure_password
  #validates :password, length: { minimum: 6 }
end
