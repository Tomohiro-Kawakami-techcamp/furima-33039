class ItemsController < ApplicationController
  before_action :authenticate_user!,  except: [:index, :show]
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :move_to_index, only: :edit
  before_action :search_item, only: [:index, :search]

  def index
   @items = Item.all.order("created_at DESC")
   set_item_column
   set_category
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to  items_path
    else
      render :new
    end
  end

  def search
    @results = @p.result.includes(:category)
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to  item_path
    else
      render :edit
    end
  end

  def destroy
    if user_signed_in? && current_user.id == @item.user_id
      @item.destroy
      redirect_to  items_path
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :info, :price, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    if current_user.id != @item.user_id || @item.order.present?
      redirect_to action: :index
    end
  end

  def search_item
    @p = Item.ransack(params[:q])
  end

  def set_item_column
    @item_name = Item.select("name").distinct
  end

  def set_category
    @category_name = Category.name
  end
end