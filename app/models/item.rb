class Item < ApplicationRecord
  attachment :image

  belongs_to :genre
  has_many :order_details, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :customers, through: :cart_items

  def add_tax_price
    (self.price * 1.08).round
  end
end
