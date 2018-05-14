class ProductsController < ApplicationController
  before_action :load_category

  def index
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = @category.products.build(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @product = @category.products.find(params[:id])
  end

  def update
    @product = @category.products.find(params[:id])
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @product = @category.products.find(params[:id])
    @product.destroy
    redirect_to root_path
  end

  def import
    Product.import(params[:file], @category_id)
    redirect_to root_path, notice: 'Products imported.'
  end

  private

  def load_category
    @category = Category.find(params[:category_id])
    @category_id = @category.id
  end

  def product_params
    params.require(:product)
        .permit(:name, :ingredients, :proteins, :grease, :fats,
                :calories, :carbohydrates, :image, :weight, :price)
  end
end
