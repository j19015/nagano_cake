class Item < ApplicationRecord
    belongs_to :genre
    has_many :order_details
    has_one_attached :product_image
    validates :name,presence: true
    validates :explanation,presence: true
    validates :price,presence: true
    validates :is_saled, inclusion: [true, false]

    def get_product_image(width, height)
        unless product_image.attached?
          file_path = Rails.root.join('app/assets/images/no_image.jpg')
          product_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
        end
        product_image.variant(resize_to_limit: [width, height]).processed
    end

    def with_tax_price
      (price * 1.1).floor
    end
end
