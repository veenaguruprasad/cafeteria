class CartsController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def create
    item_id = params[:button]
    user_id = current_user.id
    quantity = params[:quantity]
    cart = Cart.create!(user_id: user_id, item_id: item_id, quantity: quantity)
    redirect_to "/"
  end

  def order

  end
end
