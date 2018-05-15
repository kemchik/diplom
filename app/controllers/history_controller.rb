class HistoryController < ApplicationController
  before_action :load_category

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

  def show
  end

  def new
  end

  def create

    if user_signed_in?
      @order = Order.where(user_id: current_user, status: 'send')
    else
      if session[:orders].blank?
        @order
      else
        @order = []
        session[:orders].each do |order|
          @order << Order.new( product_id: order['product_id'], amount: order['amount']) end
      end
    end

    @order.each do |order|
      @history = History.new
      if user_signed_in?
        @history.user = current_user
        @history.order = order
          if @history.save
            redirect_to root_path
          else
          end
      end
    end
  end

  def update
  end

  def destroy
  end

end
