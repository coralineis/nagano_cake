class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order

  enum making_status: { discontinued: 0, preparing: 1, processing: 2, complete: 3 }
end
