class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index]
  before_action :set_item, only: [:edit, :show]


  def new
    @item = Item.new
  end

  def index
    @items = Item.all
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



  private

  def item_params
    params.require(:item).permit(:image, :name, :price, :item_text, :category_id, :situation_id, :shipping_id, :delivery_area_id, :delivery_day_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end