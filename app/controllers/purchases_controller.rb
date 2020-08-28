class PurchasesController < ApplicationController
  before_action :move_to_new_user_session_purchase
  before_action :move_to_root_path_purchase
  before_action :move_to_root_path_item_purchase
  before_action :set_item

  def index
    @purchase = PurchaseAddress.new
  end

  def create
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

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_new_user_session_purchase
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def move_to_root_path_purchase
    item =Item.find(params[:item_id])
    if user_signed_in? && current_user.id == item.user.id
      redirect_to root_path
    end
  end

  def move_to_root_path_item_purchase
    item =Item.find(params[:item_id])
    if item.purchase != nil 
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
