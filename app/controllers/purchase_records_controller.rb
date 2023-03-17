class PurchaseRecordsController < ApplicationController


  def index
    @order_form = OrderForm.new
    @item = Item.find(params[:item_id])
  end
  # def new
  #   @order_form = OrderForm.new
  # end

  def create
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new(purchase_record_params)
    if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_record_params
    params.require(:order_form).permit(:post_cord, :delivery_area_id, :municipality, :address, :building_name, :phone_number). merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_record_params[:token],
      currency: 'jpy'
    )
  end

end