class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :description, :category, :status, :burden, :region, :days, :price).merge(user_id: current_user.id)
  end


end
