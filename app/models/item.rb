class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shipping_fee_status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery
  
  with_options presence: true do
  validates :image
  validates :name
  validates :info
  validates :price,    numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  end
  
  validates_inclusion_of :price, in:300..9999999, message: 'Out of setting range'
  
  with_options numericality: { other_than: 0, message: 'Select'  } do
  validates :category_id
  validates :sales_status_id
  validates :shipping_fee_status_id 
  validates :prefecture_id 
  validates :scheduled_delivery_id 
  end
end
