class PaymentInfo < ApplicationRecord
    belongs_to :user
    belongs_to :billing_info
    has_many :orders
   

end
