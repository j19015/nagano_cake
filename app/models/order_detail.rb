class OrderDetail < ApplicationRecord
    belongs_to :order
    belongs_to :item
    enum order_status: { wait: 0, wait_making: 1, making: 2, delivery_wait: 3, making_complete:4}
end
