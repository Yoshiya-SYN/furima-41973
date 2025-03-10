class OrdersController < ApplicationController
  before_action :set_product

  def index
    @order = Order.new
  end

  def create
    set_product
    @order = @product.orders.build(order_params)
  end



  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def order_params
    params.require(:order).permit(:product_id, :user_id)
  end

end
