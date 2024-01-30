require 'rails_helper'
RSpec.describe OrderPurchaseHistory, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user: user)
    @order_purchase_history = FactoryBot.build(:order_purchase_history, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品の購入' do
    context '商品の購入ができる時' do
      it '必須項目がすべて揃っていれば購入できる' do
        expect(@order_purchase_history).to be_valid
      end
      it 'buildingは任意である' do
        @order_purchase_history.building = ''
        expect(@order_purchase_history).to be_valid
      end
    end

    context '商品の購入ができない時' do
      it 'postal_codeが空だと保存できない' do
        @order_purchase_history.postal_code = ''
        @order_purchase_history.valid?
        expect(@order_purchase_history.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含まないと保存できない' do
        @order_purchase_history.postal_code = '1234567'
        @order_purchase_history.valid?
        expect(@order_purchase_history.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'postal_codeが半角数字以外だと保存できない' do
        @order_purchase_history.postal_code = 'aaaaaaa'
        @order_purchase_history.valid?
        expect(@order_purchase_history.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idが空だと保存できない' do
        @order_purchase_history.prefecture_id = 1
        @order_purchase_history.valid?
        expect(@order_purchase_history.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できない' do
        @order_purchase_history.city = ''
        @order_purchase_history.valid?
        expect(@order_purchase_history.errors.full_messages).to include("City can't be blank")
      end
      it 'addressesが空だと保存できない' do
        @order_purchase_history.addresses = ''
        @order_purchase_history.valid?
        expect(@order_purchase_history.errors.full_messages).to include("Addresses can't be blank")
      end
      it 'phone_numberが空だと保存できない' do
        @order_purchase_history.phone_number = ''
        @order_purchase_history.valid?
        expect(@order_purchase_history.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが全角数字だと保存できない' do
        @order_purchase_history.phone_number = '１２３４５６７８９１０'
        @order_purchase_history.valid?
        expect(@order_purchase_history.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it 'item_idに紐づいていないと保存できない' do
        @order_purchase_history.item_id = nil
        @order_purchase_history.valid?
        expect(@order_purchase_history.errors.full_messages).to include("Item can't be blank")
      end
      it 'user_idに紐づいていないと保存できない' do
        @order_purchase_history.user_id = nil
        @order_purchase_history.valid?
        expect(@order_purchase_history.errors.full_messages).to include("User can't be blank")
      end
      # it 'order_idに紐づいていないと保存できない' do
      #   @order_purchase_history.order_id = nil
      #   @order_purchase_history.valid?
      #   expect(@order_purchase_history.errors.full_messages).to include("Order can't be blank")
      # end
    end
  end
end