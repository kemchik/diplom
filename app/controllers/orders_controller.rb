class OrdersController < ApplicationController
  before_action :load_product, only: [:new, :create]

    def index
      if user_signed_in?
        @order = Order.where(user_id: current_user, status: nil)
      else
        if session[:orders].blank?
          @order
        else
          @order = []
          session[:orders].each do |order|
            @order << Order.new( product_id: order['product_id'], amount: order['amount']) end
          end
      end
    end

    def new
      @order = Order.new
    end

    def create
      if user_signed_in?
        @order = @product.orders.build(order_params)
        @order.user = current_user
        if @order.save
          redirect_to category_products_path(@product.category_id)
        else
          render :new
        end
      else
        session[:orders] ||= []
        session[:orders] << {product_id: @product.id, amount: order_params[:amount] }
        redirect_to category_products_path(@product.category_id)
      end
    end

    def destroy
      if user_signed_in?
        @order = Order.find(params[:id])
        @order.destroy
      else
        session[:orders].reject!{|order| order[:product_id] == params[:product_id]}
      end
      redirect_to orders_path
    end

    private

    def order_params
      params.require(:order).permit(:amount)
    end

  def load_product
    @product = Product.find(params[:product_id])
  end
end
