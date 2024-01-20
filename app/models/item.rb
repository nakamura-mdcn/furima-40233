class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery
  belongs_to :user
  # has_one :purchase_history
  
  has_one_attached :image
  validates :image, presence: { message: "can't be blank" }

  #空の投稿を保存できないようにする
  validates :name, :information, presence: true

  #ジャンルの選択が「---」の時は保存できないようにする
  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_status_id
    validates :prefecture_id
    validates :scheduled_delivery_id
  end

  validates :price, presence: true, numericality: {
    only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid", allow_blank: true
  }
end

