class ItemsController < ApplicationController
  before_action :move_to_new_user_session, except: [:index, :show]

  def index
    @items = Item.all
  end

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

  def show
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :burden_id, :region_id, :days_id, :price).merge(user_id: current_user.id)
  end

  def move_to_new_user_session
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

end
