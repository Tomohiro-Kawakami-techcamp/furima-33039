class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shipping_fee_status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery
  
  validates :image,                   presence: true
  validates :name,                    presence: true,  unless: :was_attached?
  validates :info,                    presence: true,  unless: :was_attached?
  validates :price,                   presence: true,  numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }, unless: :was_attached?
  validates :price,                   presence: true,  format: { with: /\d[300-9999999]\d/, message: 'Out of setting range' }, unless: :was_attached?
  validates :category_id,             numericality: { other_than: 0, message: 'Select'  }, unless: :was_attached? 
  validates :sales_status_id,         numericality: { other_than: 0, message: 'Select' }, unless: :was_attached? 
  validates :shipping_fee_status_id,  numericality: { other_than: 0, message: 'Select' }, unless: :was_attached? 
  validates :prefecture_id,           numericality: { other_than: 0, message: 'Select' }, unless: :was_attached? 
  validates :scheduled_delivery_id,   numericality: { other_than: 0, message: 'Select' }, unless: :was_attached? 

  def was_attached?
    self.image.attached?
  end
end
