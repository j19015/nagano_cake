class OrderDetail < ApplicationRecord
    belongs_to :order
    belongs_to :item
    enum order_status: { wait: 0, wait_making: 1, making: 2, making_complete:3}
    def full_address
        '〒' + post_code + ' ' + address + ' ' + name
    end
end
