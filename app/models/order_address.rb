class OrderAddress
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture, :city, :block, :building, :phone_number, :user_id, :item_id, :order_id

  with_options presence: true do
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :block
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "can't be blank"}
    validates :item_id
    validates :user_id
  end
  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postcode: postcode, prefecture: prefecture, city: city, block: block, building: building, phone_number: phone_number, order_id: order.id)
  end
end