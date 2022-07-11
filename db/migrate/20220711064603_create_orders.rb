class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :end_user_id
      t.integer :postage
      t.integer :total_payment
      t.integer :order_status
      t.integer :pay_method
      t.string :post_code
      t.string :address
      t.string :name
      t.timestamps
    end
  end
end
