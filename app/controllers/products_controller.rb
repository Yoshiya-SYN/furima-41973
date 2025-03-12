class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_product, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, only: [:edit]

  def index
    @product = Product.all.order('created_at DESC')
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if current_user.id == @product.user_id
      @product.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def product_params
    params.require(:product).permit(:image, :title, :description, :category_id, :condition_id, :shipping_fee_id, :prefecture_id,
                                    :shipping_date_id, :price).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def move_to_index
    if current_user.id != @product.user_id || @product.order.present?
      redirect_to root_path
    end
  end
end
