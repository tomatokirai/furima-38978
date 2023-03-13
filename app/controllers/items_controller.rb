class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index]


  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def item_params
    params.require(:item).permit(:image, :name, :price, :item_text, :category_id, :situation_id, :shipping_id, :delivery_area_id, :delivery_day_id).merge(user_id: current_user.id)
  end
end