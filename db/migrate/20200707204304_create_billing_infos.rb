class CreateBillingInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :billing_infos do |t|
      t.integer :user_id
      t.string :address_one
      t.string :address_two
      t.string :city
      t.string :state
      t.string :country
      t.string :zip_code

      t.timestamps
    end
  end
end
