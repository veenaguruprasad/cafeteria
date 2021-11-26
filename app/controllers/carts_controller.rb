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
    if current_user.cart.present?
      new_order = Order.create!(user_id: @current_user.id)
      total = 0
      current_user.cart.all.each do |item|
        Orderitem.create!(order_id: new_order.id, item_id: item.item_id, quantity: item.quantity)
        dish = Item.find_by(id: item.item_id)
        total = total + dish.price*quantity
        item.destroy!
      end
      new_order.amount = total
      new_order.save
      redirect_to "/"
    else
      flash[:error] = "Cart is empty!"
      redirect_to "/"
    end
  end
end
