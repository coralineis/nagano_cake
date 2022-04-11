class Item < ApplicationRecord
  attachment :image

  belongs_to :genre
  has_many :order_details, dependent: :destroy
  has_many :orders, through: :order_details
  has_many :cart_items, dependent: :destroy
  has_many :customers, through: :cart_items

  def add_tax_price
    (price * 1.08).floor
  end

  def is_active_tf
    is_active ? '販売中' : '販売停止中'
  end
end
