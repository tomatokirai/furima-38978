require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    sleep(0.1)
  end

  describe '商品の出品登録' do
    context '出品登録ができる場合' do
      it '全ての入力が存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'カテゴリーが(---)以外であれば登録できる' do
        @item.category_id = 1
        expect(@item).to be_valid
      end
      it '商品の状態が(---)以外であれば登録できる' do
        @item.situation_id = 1
        expect(@item).to be_valid
      end
      it '配送料の負担が(---)以外であれば登録できる' do
        @item.shipping_id = 1
        expect(@item).to be_valid
      end
      it '発送元の地域が(---)以外であれば登録できる' do
        @item.delivery_area_id = 1
        expect(@item).to be_valid
      end
      it '発送までの日数が(---)以外であれば登録できる' do
        @item.delivery_day_id = 1
        expect(@item).to be_valid
      end
      it '価格が300円〜9,999,999円であれば登録できる' do
        @item.price = 400
        expect(@item).to be_valid
      end
    end

    context '出品ができない場合' do
      it 'ユーザー登録している人でないと出品できない' do
        @item.user_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end
      it '商品名がないと出品できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品説明がないと出品できない' do
        @item.item_text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item text can't be blank")
      end
      it 'カテゴリーを選択しないと出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'カテゴリーが(---)だと出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態を選択しないと出品できない' do
        @item.situation_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Situation can't be blank")
      end
      it '商品の状態が(---)だと出品できない' do
        @item.situation_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Situation can't be blank")
      end
      it '配送料の負担を選択しないと出品できない' do
        @item.shipping_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping can't be blank")
      end
      it '配送料の負担が(---)だと出品できない' do
        @item.shipping_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping can't be blank")
      end
      it '発送元の地域を選択しないと出品できない' do
        @item.delivery_area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery area can't be blank")
      end
      it '発送元の地域が(---)だと出品できない' do
        @item.delivery_area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery area can't be blank")
      end
      it '発送までの日数を選択しないと出品できない' do
        @item.delivery_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank")
      end
      it '発送までの日数が(---)だと出品できない' do
        @item.delivery_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank")
      end
      it '画像がないと出品できない場合' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '販売価格が空欄だと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格が半角数字以外だと出品できない' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '販売価格が300未満だと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '販売価格が10000000以上だと出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

    end
  end
end
