class OrdersController < ApplicationController
  # before_action :authenticate_user!
  # def index
  #   @item = Item.find(params[:item_id])
  #   @order_purchase_history = OrderPurchaseHistory.new
  # end
  # def create
  #   @order_purchase_history = OrderPurchaseHistory.new(order_params)
  #   if @order_purchase_history.valid?
  #     @order_purchase_history.save
  #     redirect_to root_path
  #   else
  #     render :index, status: :unprocessable_entity
  #   end

  # end

  # private
  # def order_params
  #   params.require(:order_purchase_history).permit(:postal_code, :city, :addresses, :building, :phone_number, :prefecture_id).merge(user_id: current_user.id, item_id: params[:item_id].to_i)
  # end
  
end

