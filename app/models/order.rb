class Order < ApplicationRecord
    belongs_to :user
    belongs_to :shipping_info
    belongs_to :payment_info
    belongs_to :billing_info
    has_many :order_items
    has_many :items, through: :order_items

end
