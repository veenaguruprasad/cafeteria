class CartsController < ApplicationController
  def create
    item_id = params[:button]
    user_id = current_user.id
    quantity = params[:quantity]
    cart = Cart.new(user_id: user_id, item_id: item_id, quantity: quantity)
    if cart.save
      redirect_to "/"
    else
      flash[:error] = cart.errors.full_messages.join(", ")
      redirect_to "/"
    end
  end

  def order
    if current_user.cart.present?
      new_order = Order.create!(user_id: @current_user.id)
      total = 0
      current_user.cart.all.each do |item|
        Orderitem.create!(order_id: new_order.id, item_id: item.item_id, quantity: item.quantity)
        dish = Item.find_by(id: item.item_id)
        total = total + dish.price*item.quantity
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

  def destroy
    id = params[:id]
    cart_item = current_user.cart.find(id)
    cart_item.destroy
    redirect_to "/"
  end
end
