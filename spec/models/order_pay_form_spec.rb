require 'rails_helper'

RSpec.describe OrderPayForm, type: :model do
  before do
    @order_pay_form = FactoryBot.build(:order_pay_form)
  end

  describe 'ユーザー新規登録' do
    context '商品が購入できるとき' do

      it '郵便番号を入力が必須。' do
        @order_pay_form.postal_code = "111-2222"
        expect(@order_pay_form).to be_valid
      end

      it '都道府県の入力が必須' do
        @order_pay_form.prefecture_id = 2
        expect(@order_pay_form).to be_valid
      end

      it '市区町村の入力が必須' do
        @order_pay_form.city = "横浜市緑区"
        expect(@order_pay_form).to be_valid
      end

      it '番地の入力が必須' do
        @order_pay_form.city = "柳ビル"
        expect(@order_pay_form).to be_valid
      end

      it '電話番号の入力が必須' do
        @order_pay_form.phone_number = "09012345678"
        expect(@order_pay_form).to be_valid
      end
    end

    context '商品が購入できないとき' do

      it '郵便番号の入力が無い。' do
        @order_pay_form.postal_code = ""
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号に-が含まれていない。' do
        @order_pay_form.postal_code = '1112222'
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it '都道府県の入力が無い。' do
        @order_pay_form.prefecture_id = "1"
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include("Prefecture must be other than 1")
      end
      
      it '市区町村の入力が無い。' do
        @order_pay_form.city = ""
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include("City can't be blank")
      end

      it '番地の入力が無い。' do
        @order_pay_form.addresses = ""
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include("Addresses can't be blank")
      end

      it '電話番号の入力が無い。' do
        @order_pay_form.phone_number = ""
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号は11桁以内。' do
        @order_pay_form.phone_number = "090123456789123"
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end