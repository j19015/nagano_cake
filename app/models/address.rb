class Address < ApplicationRecord
    belongs_to :end_user
    validates :address,presence: true
    validates :post_code,presence: true
    validates :name,presence: true
    validates :end_user_id,presence: true
    def full_address
        '〒' + post_code + ' ' + address + ' ' + name
    end
end
