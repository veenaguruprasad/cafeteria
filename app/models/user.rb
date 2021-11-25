class User < ActiveRecord::Base
  has_secure_password
  has_many :carts
  validates :name, presence: true
  validates :email, { presence: true, uniqueness: true }
end
