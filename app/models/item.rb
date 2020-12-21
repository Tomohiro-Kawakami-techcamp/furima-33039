class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :image,                   presence: true
  validates :name,                    presence: true,  unless: :was_attached?
  validates :info,                    presence: true,  unless: :was_attached?
  validates :price,                   presence: true,  unless: :was_attached?
  validates :category_id,             presence: true,  unless: :was_attached?
  validates :sales_status_id,         presence: true,  unless: :was_attached?
  validates :shipping_fee_status_id,  presence: true,  unless: :was_attached?
  validates :prefecture_id,           presence: true,  unless: :was_attached?
  validates :scheduled_delivery_id,   presence: true,  unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
end
