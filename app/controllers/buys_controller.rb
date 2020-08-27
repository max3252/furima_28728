class BuysController < ApplicationController
  before_action :authenticate_user!
  before_action :solditem_buy
  before_action :buy_direct

  def index
    @item = Item.find(params[:item_id])
    @buy = AddressBuy.new
  end

  def new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @buy = AddressBuy.new(address_params)
    if @buy.valid?
      pay_item
      @buy.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def address_params
    params.require(:address_buy).permit(:postal_code, :prefecture_id, :city, :address_line1, :address_line2, :phone_num).merge(user_id: current_user.id, item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end

  def solditem_buy
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.buy
  end

  def buy_direct
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.user_id == current_user.id
  end
end
