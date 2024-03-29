class ItemsController < ApplicationController
  before_action :move_to_new_user_session, except: [:index, :show, :search]
  before_action :move_to_root_path, except: [:index, :new, :create, :show, :search]
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.all
    @purchase = PurchaseAddress.new
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
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
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

  def destroy
    item = Item.find(params[:id])
    if item.destroy
      redirect_to root_path
    end
  end

  def search
    @items = Item.search(params[:keyword])
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

  def move_to_root_path
    item =Item.find(params[:id])
    if user_signed_in? && current_user.id != item.user.id
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
