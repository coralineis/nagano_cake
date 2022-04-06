class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  has_many :items, through: :order_details
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { pre_order: 0, order_placed: 1, making_items: 2, prepare_for_shipping: 3, shipped: 4 }

end
