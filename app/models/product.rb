class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_date

  validates :title, :description, :price, presence: true

  validates :category_id,      numericality: { other_than: 1 , message: "can't be blank" }
  validates :condition_id,     numericality: { other_than: 1 , message: "can't be blank" }
  validates :shipping_fee_id,  numericality: { other_than: 1 , message: "can't be blank" }
  validates :prefecture_id,    numericality: { other_than: 1 , message: "can't be blank" }
  validates :shipping_date_id, numericality: { other_than: 1 , message: "can't be blank" }

  private

  def product_params
    params.require(:product).permit(:image, :title, :description, :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :shipping_date_id, :price).merge(user_id: current_user.id)
  end

end
