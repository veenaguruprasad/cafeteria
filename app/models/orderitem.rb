class Orderitem < ActiveRecord::Base
  belongs_to :order
  has_many :items
end
