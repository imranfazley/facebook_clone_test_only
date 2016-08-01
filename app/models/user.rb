require 'bcrypt'

class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => /@/
  validates :password, presence: true, length: {in: 6..20}
  validates :password_confirmation, presence: true
  has_secure_password

  has_many :statuses, dependent: :destroy
  has_many :likes, dependent: :destroy

end
