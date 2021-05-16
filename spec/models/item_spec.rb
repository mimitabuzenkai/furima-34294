require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品が出品できるとき' do

      it '商品画像の選択が必須' do
        expect(@item).to be_valid
      end

      it '商品名の入力が必須' do
        @item.name = "onigiri"
        expect(@item).to be_valid
      end

      it '商品情報の入力が必須' do
        @item.info = "onigiri"
        expect(@item).to be_valid
      end

      it 'カテゴリーの選択が必須' do
        @item.category_id = 2
        expect(@item).to be_valid
      end

      it '商品状態の選択が必須' do
        @item.sales_status_id = 2
        expect(@item).to be_valid
      end

      it '発送日数の選択が必須' do
        @item.delivery_charge_id = 2
        expect(@item).to be_valid
      end

      it '発送元（地域）の選択が必須' do
        @item.prefecture_id = 2
        expect(@item).to be_valid
      end

      it '販売価格の入力が必須' do
        @item.price = 3000
        expect(@item).to be_valid
      end

      it '販売価格が¥300~¥10,000,000の間なら保存できる' do
        @item.price = 1000
        expect(@item).to be_valid
      end

      it '販売価格が半角数字なら保存できる' do
        @item.price = 1000
        expect(@item).to be_valid
      end
    end

    context '商品が出品できないとき' do

      it '商品画像が無いと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が無いと登録できない' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品情報が無いと登録できない' do
        @item.info = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end

      it 'カテゴリーの選択が無いと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it '商品状態の選択が無いと登録できない' do
        @item.sales_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status must be other than 1")
      end

      it '発送日数の選択が無いと登録できない' do
        @item.scheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery must be other than 1")
      end

      it '発送元（地域）の選択が無いと登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it '販売価格の入力が無いと登録できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '販売価格が¥300より少ない時は出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end

      it '販売価格が、¥9,999,999より多い時は出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 10000000")
      end

      it '販売価格が英字では出品できない' do
        @item.price = "aaaAAA"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it '販売価格が漢字・ひらがな・カタカナでは出品できない' do
        @item.price = "あ阿カ"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end

