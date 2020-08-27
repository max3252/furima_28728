require 'rails_helper'

describe AddressBuy do
  before do
    @address_buy = FactoryBot.build(:address_buy)
  end
  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it '値が正しく入力されていれば保存できること' do
        expect(@address_buy).to be_valid
      end

      it 'address_line2は空でも保存できること' do
        @address_buy.address_line2 = nil
        expect(@address_buy).to be_valid
      end

    end
   
    context '商品購入がうまくいかないとき' do
      it 'postal_codeが空では保存できないこと' do
        @address_buy.postal_code = ''
        @address_buy.valid?
        expect(@address_buy.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが"-"を含まないと保存できないこと' do
        @address_buy.postal_code = '1111111'
        @address_buy.valid?
        expect(@address_buy.errors.full_messages).to include("Postal code Input correctly")
      end

      it 'prefecture_idを選択しなければ出品できない' do
        @address_buy.prefecture_id = '1'
        @address_buy.valid?
        expect(@address_buy.errors.full_messages).to include("Prefecture Select")
      end

      it 'cityが空だと保存できないこと' do
        @address_buy.city = ''
        @address_buy.valid?
        expect(@address_buy.errors.full_messages).to include("City can't be blank")
      end

      it 'address_line1が空だと保存できないこと' do
        @address_buy.address_line1 = ''
        @address_buy.valid?
        expect(@address_buy.errors.full_messages).to include("Address line1 can't be blank")
      end

      it 'phone_numが空だと保存できないこと' do
        @address_buy.phone_num = ''
        @address_buy.valid?
        expect(@address_buy.errors.full_messages).to include("Phone num can't be blank")
      end

      it 'phone_numが"-"を含むとと保存できないこと' do
        @address_buy.phone_num = '090-1234123'
        @address_buy.valid?
        expect(@address_buy.errors.full_messages).to include("Phone num Input correctly")
      end

    end
  end
end