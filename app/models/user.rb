class User < ApplicationRecord
    has_many :address_infos
    has_many :payment_infos
    has_many :orders
    has_many :items, through: :orders

end
