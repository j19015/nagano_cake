class Order < ApplicationRecord
    belongs_to :end_user
    has_many :order_details
    validates :postage,presence: true
    validates :total_payment,presence: true
    validates :order_status,presence: true
    validates :pay_method,presence: true
    enum pay_method: { credit_card: 0, transfer: 1 }
    enum order_status: { wait: 0, wait_confirm: 1, making: 2, delivery_wait: 3, delivery_complete:4}
    def full_address
        '〒' + post_code + ' ' + address + ' ' + name
    end
end
