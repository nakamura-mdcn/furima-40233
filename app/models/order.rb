class Order < ApplicationRecord
  belongs_to :purchase_history
end
  # validates :city, presence: true
  # validates :addresses, presence: true

  # validates :phone_number, presence: true, format:{with: /\A[0-9]{11}\z/, message: "is invalid. Input only number"}

  # validates :postal_code, presence: true, format:{with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
  
  # #ジャンルの選択が「---」の時は保存できないようにする
  # validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  # belongs_to :prefecture
