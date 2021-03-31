class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.order("created_at DESC")
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
  
  def edit
    @item = Item.find(params[:id])
    unless @item.user == current_user
      redirect_to action: :index
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end
  
  # 削除機能
  # def destroy
  #   item = Item.find(params[:id])
  #   if user_signed_in? && current_user.id == item.user_id
  #     if item.destroy
  #       redirect_to root_path
  #     end
  #   end
  # end

  private
  def item_params
    params.require(:item).permit(:title, :text, :price, :image, :category_id, :condition_id, :delivery_charge_id, :delivery_area_id, :delivery_day_id).merge(user_id: current_user.id)
  end
end