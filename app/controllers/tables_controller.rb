class TablesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @tables = Table.all
  end

  def create

  end


  def update

  end

  def destroy
  end

  def order_params
    params.require(:table_id).permit(:table_id)
  end
end
