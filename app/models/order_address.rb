class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :zipcode, :prefecture_id, :city, :street, :building, :phone, :token, :price

  with_options presence: true do
    validates :user_id, :token, :product_id, :city, :street
    validates :zipcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :phone, length: {
      minimum: 10,
      maximum: 11,
      too_short: 'number is too short',
      too_long: 'number is too long'
    }, format: { with: /\A\d+\z/, message: 'number is invalid. Input only number' }
  end

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    # 寄付情報を保存し、変数donationに代入する
    order = Order.create(product_id: product_id, user_id: user_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    Address.create(zipcode: zipcode, prefecture_id: prefecture_id, city: city, street: street, building: building, phone: phone,
                   order_id: order.id)
  end
end
