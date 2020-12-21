class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  
  validates :image,                   presence: true
  validates :name,                    presence: true,  unless: :was_attached?
  validates :info,                    presence: true,  unless: :was_attached?
  validates :price,                   presence: true,  unless: :was_attached?
  validates :category_id,             presence: true,  unless: :was_attached?
  validates :sales_status_id,         presence: true,  unless: :was_attached?
  validates :shipping_fee_status_id,  presence: true,  unless: :was_attached?
  validates :prefecture_id,           numericality: { other_than: 1 }, unless: :was_attached? 
  validates :scheduled_delivery_id,   presence: true,  unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
end
