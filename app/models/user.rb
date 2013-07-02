require 'bcrypt'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :password, :token, :username
  # attr_reader :password
  # 
  # validates :username, :password_digest, :presence => true
  # validates :password, :length => { :minimum => 3 }
  
  has_many :assessments, foreign_key: :administrator_id
  has_many :assessment_attempts, foreign_key: :candidate_id
  # 
  # def password
  #   @password ||= self.password_digest
  # end
  # 
  # def password=(pass)
  #   self.password_digest = BCrypt::Password.create(pass)
  # end
  # 
  # def validate_password(pass)
  #   BCrypt::Password.new(self.password_digest) == pass
  # end
  # 
  # def reset_token
  #   self.token = SecureRandom.urlsafe_base64(16)
  #   self.save!
  #   self.token
  # end
end
