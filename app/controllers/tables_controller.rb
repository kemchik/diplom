class TablesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @tables = Table.all
  end

  def create
    # @order_params[:table]
    if user_signed_in?
      @orders = Order.where(user_id: current_user, status: nil)
      # else
      # if session[:orders].blank?
      #   @orders
      # else
      #   @orders = []
      #   session[:orders].each do |order|
      #     @orders << Order.new( product_id: order['product_id'], amount: order['amount']) end
      # end
    end
    @orders.table_id =
  end


  def update

  end

  def destroy
  end

  def order_params
    params.require(:table_id).permit(:table_id)
  end
end
