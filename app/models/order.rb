class Order < ApplicationRecord
    belongs_to :end_users
    has_many :order_details
end
