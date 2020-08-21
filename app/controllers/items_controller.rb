class ItemsController < ApplicationController
  def index
    @items = Item.all
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path(@user)
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :price, :category_id, :status_id, :burden_id, :prefecture_id, :day_id).merge(user_id: current_user.id)
  end
end
