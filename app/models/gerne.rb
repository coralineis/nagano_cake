class Gerne < ApplicationRecord
  has_many :items, dependent: :destroy
end
