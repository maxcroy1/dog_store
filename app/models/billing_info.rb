class BillingInfo < ApplicationRecord
    belongs_to :user
    has_many :payment_infos
    has_many :orders
end
