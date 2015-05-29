class User < ActiveRecord::Base
# self.include_root_in_json = true
has_secure_password
before_save { self.email = email.downcase }
# attr_protected :password_digest
validates :name, presence: true, length: {maximum: 50}
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, presence: true, length: {maximum: 255}, format: { with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
validates :password, length: {minimum: 6}, :presence => :true, :confirmation => :true
validates :password_confirmation, :presence => { :if => :password }

def self.authenticate(email, pass)
    debugger
    user = where(:email => email).first
    user && BCrypt::Password.new(user.password_digest) == pass ? user : nil
  end
  
def password=(password)
    return if password.blank?
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
# def as_json(options = {})
#   super(options.merge(:except => [ :encrypted_password ], :only => [:id, :name, :email]))
# end
end
