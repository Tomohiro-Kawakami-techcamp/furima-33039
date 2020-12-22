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
  validates :name,                    presence: true
  validates :info,                    presence: true
  validates :price,                   presence: true,  numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  #validates :price,                   presence: true,  format: { with: /\d[300-9999999]\d/, message: 'Out of setting range' }
  validates_inclusion_of :price, in:300..9999999, message: 'Out of setting range'
  validates :category_id,             numericality: { other_than: 0, message: 'Select'  }
  validates :sales_status_id,         numericality: { other_than: 0, message: 'Select' } 
  validates :shipping_fee_status_id,  numericality: { other_than: 0, message: 'Select' } 
  validates :prefecture_id,           numericality: { other_than: 0, message: 'Select' } 
  validates :scheduled_delivery_id,   numericality: { other_than: 0, message: 'Select' } 

end
