class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :items
  validates :item_id, presence: true
  validates :quantity, presence: true
end
