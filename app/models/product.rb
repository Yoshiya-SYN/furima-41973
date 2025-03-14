class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_date

  validates :title, :description, :price, :image, presence: true

  validates :category_id,      numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id,     numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_fee_id,  numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id,    numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_date_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true }
end
