class OrdersController < ApplicationController
  before_action :set_product
  before_action :authenticate_user!, only: [:index]
  before_action :move_to_index, only: [:index]

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @order_address = OrderAddress.new
  end

  def create
    set_product
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def order_params
    params.require(:order_address).permit(:product_id, :user_id, :zipcode, :prefecture_id, :city, :street, :building, :phone).merge(
      user_id: current_user.id, token: params[:token], price: params[:price], product_id: params[:product_id]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy' # 通貨の種類（日本円）
    )
  end

  def move_to_index
    return unless current_user.id == @product.user_id || @product.order.present?

    redirect_to root_path
  end
end
