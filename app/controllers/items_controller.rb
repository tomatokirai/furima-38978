class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update]


  def new
    @item = Item.new
  end

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end



  private

  def item_params
    params.require(:item).permit(:image, :name, :price, :item_text, :category_id, :situation_id, :shipping_id, :delivery_area_id, :delivery_day_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end