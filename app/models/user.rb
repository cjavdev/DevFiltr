# require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessible :password, :token, :username
  attr_reader :password
  
  validates :username, :password_digest, :presence => true
  validates :password, :length => { :minimum => 3 }
  
  has_many :assessments, foreign_key: :administrator_id
  has_many :assessment_attempts, foreign_key: :candidate_id
  
  def password
    @password ||= self.password_digest
  end
  
  def password=(pass)
    self.password_digest = BCrypt::Password.create(pass)
  end
  
  def validate_password(pass)
    BCrypt::Password.new(self.password_digest) == pass
  end
  
  def reset_token
    self.token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.token
  end
end
