class HistoriesController < ApplicationController
  before_action :load_table, only: [:create]

  def index
    if user_signed_in?
      @order = Order.where(user_id: current_user, status: 'processing')
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

  def create
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

    @order.each do |order|
      @history = History.new
      if user_signed_in?
        @history.user = current_user
        @history.order = order
        @history.save
      end
    end
    # make table params
    @order.update_all(table_id: @table.id, status: 'processing')
    redirect_to root_path
  end

  def update
  end

  def destroy
  end

  def load_table
    @table = Table.find(params[:table_id])
  end

end
