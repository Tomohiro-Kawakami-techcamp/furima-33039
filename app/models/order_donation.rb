class OrderDonation
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :token

  with_options presence: true do
  validates :token
  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "input correctly" }
  validates :city
  validates :address
  end

  validates :prefecture_id, numericality: { other_than: 0, message: "Select" }
  validates :phone_number,  presence: true, numericality: { with: /\A[0-9]+\z/, message: "is Half-width number" }
  validates :phone_number, format: { with: /\A[0-9]{,11}\z/, message: "is less than 11 number characters" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end
end
