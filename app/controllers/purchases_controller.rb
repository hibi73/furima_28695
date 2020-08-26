class PurchasesController < ApplicationController

  def index
    # binding.pry
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

  def order_params
    params.permit(:token, :postal_code, :prefectures, :municipality, :house_number, :building_name, :phone_number)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      card: order_params[:token],    
      currency:'jpy'                 
    )
  end
  
end
