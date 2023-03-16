require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @order_form = FactoryBot.build(:order_form)
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができる場合' do
      it '全ての項目の入力が存在すれば保存できる' do
        expect(@order_form).to be_valid
      end
      it '建物名が存在しなくても保存できる' do
        @order_form.building_name = ''
        expect(@order_form).to be_valid
      end

    end

    context '配送先情報の保存がができない場合' do
      it 'user_idが空だと保存できない' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空だと保存できない' do
        @order_form.post_cord = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post cord can't be blank")
      end
      it '郵便番号が「3桁ハイフン4桁」の半角文字列でないと保存できない' do
        @order_form.post_cord = 1-2-3333334
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post cord is invalid. Include hyphen(-)")
      end
      it '都道府県が空だと保存できない' do
        @order_form.delivery_area_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Delivery area can't be blank")
      end
      it '都道府県が(---)だと保存できない' do
        @order_form.delivery_area_id = 0
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Delivery area can't be blank")
      end
      it '市区町村が空だと保存できない' do
        @order_form.municipality = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が空だと保存できない' do
        @order_form.address = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと保存できない' do
        @order_form.phone_number = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が10桁以上11桁以内でないと保存できない' do
        @order_form.phone_number = 1231231231233
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が半角数値でないと保存できない' do
        @order_form.phone_number = 123123123-3
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end