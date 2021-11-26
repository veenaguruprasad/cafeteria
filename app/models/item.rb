class Item < ActiveRecord::Base
  belongs_to :submenu

  def self.breakfast
    where(submenu_id: "1")
  end

  def self.meals
    where(submenu_id: "2")
  end

  def self.beverages
    where(submenu_id: "3")
  end
end
