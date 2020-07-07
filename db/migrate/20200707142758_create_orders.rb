class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :shipping_info_id
      t.integer :billing_info_id
      t.integer :payment_info_id
      t.integer :total

      t.timestamps
    end
  end
end
