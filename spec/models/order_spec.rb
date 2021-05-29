require 'rails_helper'

RSpec.describe OrderPayForm, type: :model do
  before do
    @order_pay_form = FactoryBot.build(:order_pay_form)
  end

  describe 'ユーザー新規登録' do
    context '商品が購入できるとき' do

      it 'カード情報を入力すると購入できる' do
      end

      it '商品画像の選択が必須' do
      end
    end

    context '商品が購入できないとき' do

      it 'カード情報の入力が無いと登録できない' do

      end
    end
  end
end