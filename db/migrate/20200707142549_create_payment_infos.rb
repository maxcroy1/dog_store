class CreatePaymentInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :payment_infos do |t|
      t.integer :user_id
      t.integer :billing_info_id
      t.string :name_on_card
      t.integer :card_number
      t.datetime :expiration
      t.integer :cvc
      t.string :zip_code

      t.timestamps
    end
  end
end
