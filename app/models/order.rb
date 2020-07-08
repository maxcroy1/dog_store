class Order < ApplicationRecord
    belongs_to :user
    belongs_to :shipping_info
    belongs_to :payment_info
    belongs_to :billing_info
    has_many :order_items
    has_many :items, through: :order_items

    accepts_nested_attributes_for :user
    accepts_nested_attributes_for :shipping_info
    accepts_nested_attributes_for :billing_info
    accepts_nested_attributes_for :payment_info

end
