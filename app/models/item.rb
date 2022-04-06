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
end
