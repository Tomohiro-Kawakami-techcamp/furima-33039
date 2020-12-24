class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    #@order = Order.create(params[:item_id])
    #@address = Address.create(address_params)
  end

  private
  def order_params
    params.require(:order).permit(user_id: current_user.id, item_id: current_item.id)
  end

  def address_params
    params.require(:comment).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(order_id: params[:order_id])
  end
end