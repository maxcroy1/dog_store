class User < ApplicationRecord
    has_many :shipping_infos
    has_many :billing_infos
    has_many :payment_infos
    has_many :orders
    has_many :items, through: :orders

end
