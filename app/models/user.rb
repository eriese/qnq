class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :name, :password, :password_confirmation, :fb_email, :fb_pass, :gender, :sexuality
  validates :fb_email, :presence => true, :uniqueness => true
  validates :password, :password_confirmation, :presence => true
  validates :password, :password_confirmation, :length => {in: 6..20}
end
