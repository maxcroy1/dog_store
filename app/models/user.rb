class User < ApplicationRecord
    has_secure_password

    has_many :shipping_infos
    has_many :billing_infos
    has_many :payment_infos
    has_many :orders
    has_many :items, through: :orders

    validates :username, presence: true, uniqueness: true
    validates :password, presence: true, length: {in: 6..30}
    validates :email, presence: true, uniqueness: true

    validate :true_email

    def true_email
        if !email.include?("@")
            errors.add(:email, "Must be a valid email")
        end
    end

end
