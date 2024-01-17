class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :information, null: false
      t.string :category, null: false
      t.string :sales_status, null: false
      t.string :shipping_fee_status, null: false
      t.string :prefecture, null: false
      t.string :scheduled_delivery, null: false
      t.string :price, null: false
      t.timestamps
    end
  end
end
