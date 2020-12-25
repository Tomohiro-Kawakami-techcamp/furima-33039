class OrderDonation
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number

  with_options presence: true do
  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
  validates :city
  validates :address
  end

  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :phone_number,  numericality: { with: /\A[0-9]+\z/, message: "is Half-width number" }

  def save
    binding.pry
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end
end
