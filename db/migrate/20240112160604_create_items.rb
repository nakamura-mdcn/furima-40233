class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :information
      t.string :category
      t.string :sales_status
      t.string :shipping_fee_status
      t.integer :prefecture
      t.string :scheduled_delivery
      t.integer :price
      t.timestamps
    end
  end
end
