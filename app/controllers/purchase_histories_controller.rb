class PurchaseHistoriesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :contributor_confirmation, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_purchase_history = OrderPurchaseHistory.new
    # if @purchase_history.present?
    #   redirect_to root_path
    # end
  end
  def create
    @order_purchase_history = OrderPurchaseHistory.new(purchase_history_params)
    if @order_purchase_history.valid?
      pay_item
      @order_purchase_history.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
    
  end
  
  private
  def purchase_history_params
    params.require(:order_purchase_history).permit(:postal_code, :city, :addresses, :building, :phone_number, :prefecture_id).merge(user_id: current_user.id, item_id: params[:item_id].to_i, token: params[:token])
  end
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_history_params[:token],
      currency: 'jpy'
    )
  end
  def set_item
    @item = Item.find(params[:item_id])
  end
  def contributor_confirmation
    redirect_to root_path if current_user.id == @item.user.id || @item.purchase_history.present?
  end

end
