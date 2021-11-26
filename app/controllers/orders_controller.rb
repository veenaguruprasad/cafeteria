class OrdersController < ApplicationController
  def update
    id = params[:id]
    order = Order.find_by(id: id)
    order.completed = true
    order.save!
    redirect_to "/"
  end
end
