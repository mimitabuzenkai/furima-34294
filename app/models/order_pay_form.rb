class OrderPayForm
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :user_id, :item_id, :image, :token

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :addresses
    validates :phone_number
    validates :user_id
    validates :item_id
    validates :token
  end

  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :phone_number, format: {with: /\A0[5789]0[-]?\d{4}[-]?\d{4}\z/}
  validates :prefecture_id, numericality: { other_than: 1 }


  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    PayForm.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, order_id: order.id)
  end
end