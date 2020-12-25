class OrdersController < ApplicationController
  before_action :authenticate_user!,  only: :index
  before_action :move_to_root_path, only: :index

  def index
    @item = Item.find(params[:item_id])
    @order_donation = OrderDonation.new
  end

  def create
    @order_donation = OrderDonation.new(donation_params)
    if @order_donation.valid?
      @order_donation.save
      redirect_to  root_path
    else
      render action: :index
    end
  end

  private
  def donation_params
    params.require(:order_donation).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def move_to_root_path
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id || @item.order.present?
      redirect_to root_path
    end
  end
end