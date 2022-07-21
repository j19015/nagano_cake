class Item < ApplicationRecord
    belongs_to :genre
    has_many :order_details
    has_one_attached :image
end
