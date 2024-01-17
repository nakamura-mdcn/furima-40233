class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  #空の投稿を保存できないようにする
  validates :name, :information, presence: true

  #ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, numericality: { other_than: 1, message:"can't be blank" } 
end
