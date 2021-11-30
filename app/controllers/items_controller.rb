class ItemsController < ApplicationController
  def add
    item_name = params[:item_name]
    price = params[:price]
    submenu_id = params[:submenu_id]
    submenu_present = Submenu.find_by(id: params[:submenu_id])
    if submenu_present
      item = Item.new(item_name: item_name, price: price, submenu_id: submenu_id)
      if item.save
        redirect_to "/"
      else
        flash[:error] = "Could not save item!"
        redirect_to "/"
      end
    else
      flash[:error] = "Could not find submenu with given ID!"
      redirect_to "/"
    end
  end
end
