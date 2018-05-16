class CriterionsController < ApplicationController

  def index
  end

  def show
  end

  def new
    @criterions = Criterion.new
  end

  def create
    if user_signed_in?
      @criterion = Criterion.new
      @criterion.grease = params[:grease]
      @criterion.carbohydrates = params[:carbohydrates]
      @criterion.proteins = params[:proteins]
      @criterion.calories = params[:calories]
      @criterion = current_user
      if @criterion.save
        redirect_to root_path
      else
        render :new
      end
    end
  end

  def update
  end

  def destroy
  end

  def criyterion_params
    params.require(:criterion).permit(:proteins, :carbohydrates, :grease, :calories)
  end


end
