class User < ActiveRecord::Base
  has_secure_password
  has_many :cart
  has_many :order
  validates :name, presence: true
  validates :email, { presence: true, uniqueness: true }

  def self.customers_only
    where(user_type: "customer")
  end
end
