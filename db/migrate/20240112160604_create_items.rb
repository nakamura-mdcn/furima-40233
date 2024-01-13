class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :information
      t.string :category
      t.string :sales_status
      t.string :shipping_fee_status
      t.string :prefecture
      t.string :scheduled_delivery
      t.string :price
      t.timestamps
    end
  end
end
