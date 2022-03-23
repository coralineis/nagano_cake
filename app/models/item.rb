class Item < ApplicationRecord
  has_one_attached :image

  belongs_to :gerne
  has_many :order_details, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :customers, through: :cart_items
end
