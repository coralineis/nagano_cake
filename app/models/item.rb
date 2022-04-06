class Item < ApplicationRecord
  attachment :image

  belongs_to :genre
  has_many :order_details, dependent: :destroy
  has_many :orders, through: :order_details
  has_many :cart_items, dependent: :destroy
  has_many :customers, through: :cart_items

  enum is_active: { for_sale: 0, sold_out: 1 }

  def add_tax_price
    (price * 1.08).floor
  end
end
