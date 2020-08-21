require 'rails_helper'

describe Item do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end
  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it '全ての項目が存在すれば出品できる' do
        expect(@item).to be_valid
      end

      it '販売価格が¥300以上¥9,999,999以下であれば出品できる' do
        @item.price = '1000'
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'textが空では出品できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end

      it 'category_idを選択しなければ出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end

      it 'status_idを選択しなければ出品できない' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Status Select')
      end

      it 'burden_idを選択しなければ出品できない' do
        @item.burden_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Burden Select')
      end

      it 'prefecture_idを選択しなければ出品できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture Select')
      end

      it 'day_idを選択しなければ出品できない' do
        @item.day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Day Select')
      end

      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceは¥300以上でなければ出品できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end

      it 'priceは¥9,999,999以下でなければ出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end

      it 'priceは半角数字でなければ出品できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
    end
  end
end
