class PurchasesController < ApplicationController
  before_action :move_to_new_user_session
  before_action :move_to_root_path,

  def index
    @purchase = PurchaseAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase = PurchaseAddress.new(order_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def move_to_new_user_session
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def move_to_root_path
    item =Item.find(params[:item_id])
    if user_signed_in? && current_user.id == item.user.id
      redirect_to root_path
    end
  end

  def order_params
    params.require(:purchase_address).permit(:token, :postal_code, :prefectures, :municipality, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],    
      currency:'jpy'                 
    )
  end
  
end
