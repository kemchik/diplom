class StaffsController < ApplicationController
  def index
    @histories = History.where(status: 'processing')
  end

  def show
  end

  def new
  end

  def create

  end


  def update
  end

  def destroy
  end

end
