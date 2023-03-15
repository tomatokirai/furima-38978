class PurchaseRecordsController < ApplicationController


  def new
    @order_form = OrderAddress.new
  end

  def create
    @order_form = OrderAddress.new(purchase_record_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def purchase_record_params
    params.require(:order_form).permit(:post_cord, :delivery_area_id, :municipality, :address, :building_name, :phone_number). merge(user_id: current_user.id)
  end
  
end