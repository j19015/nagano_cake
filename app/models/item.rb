class Item < ApplicationRecord
    belongs_to :genre
    has_many :order_details
    has_one_attached :product_image
    validates :name,presence: true
    validates :explanation,presence: true
    validates :price,presence: true
    validates :product_image,presence: true
    validates :is_saled, inclusion: [true, false]
end
