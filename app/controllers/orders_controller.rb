class OrdersController < ApplicationController
  before_action :authenticate_user!,  only: :index
  before_action :set_item, only: [:index, :create]
  before_action :move_to_root_path, only: :index

  def index
    @order_donation = OrderDonation.new
  end

  def create
    @order_donation = OrderDonation.new(donation_params)
    if @order_donation.valid?
      pay_item
      @order_donation.save
      redirect_to  root_path
    else
      render action: :index
    end
  end

  private
  def donation_params
    params.require(:order_donation).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def move_to_root_path
    if current_user.id == @item.user_id || @item.order.present?
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: donation_params[:token],
      currency: 'jpy' 
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end