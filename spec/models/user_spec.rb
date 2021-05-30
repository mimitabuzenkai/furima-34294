require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do

      it 'メールアドレスの入力が必須' do
        @user.email = 'hoge@example.com'
        expect(@user).to be_valid
      end
      
      it 'パスワードの入力が必須' do
        @user.password = 'aaa000'
        @user.password_confirmation = 'aaa000'
        expect(@user).to be_valid
      end
      
      it 'パスワードが6文字以上では登録できる' do
        @user.password = '000aaa'
        @user.password_confirmation = '000aaa'
        expect(@user).to be_valid
      end
      
      
      it 'パスワードとパスワード（確認用）の値が一致していると登録できる' do
        @user.password = '123aaa'
        @user.password_confirmation = '123aaa'
        expect(@user).to be_valid
      end
      
      it '名字は、全角（漢字・ひらがな・カタカナ）で入力する' do
        @user.first_name = "あ阿ア"
        expect(@user).to be_valid
      end
      
      it '名前は、全角（漢字・ひらがな・カタカナ）で入力する' do
        @user.first_name = "あ阿ア"
        expect(@user).to be_valid
      end
      
      it '名字（フリガナ）の入力が必須' do
        @user.first_name_kana = "ナカムラ"
        expect(@user).to be_valid
      end
  
      it '名前（フリガナ）の入力が必須' do
        @user.last_name_kana = "ユウキ"
        expect(@user).to be_valid
      end
  
  
      it '生年月日の入力が必須' do
        @user.birth = "2000-01-01"
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do

      it 'メールアドレスが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'メールアドレスが他のユーザーと重複している場合、登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it 'メールアドレスに、@がないと登録できない' do
        @user.email = 'nikuniku.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'パスワードが全角（漢字・ひらがな・カタカナ）では登録できない' do
        @user.password = 'あ阿カあ阿カ'
        @user.password_confirmation = 'あ阿カあ阿カ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end

      it 'パスワードが全角（英数混合）では登録できない' do
        @user.password = 'AAA１１１'
        @user.password_confirmation = 'AAA１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end

      it 'パスワードが英字のみでは登録できない' do
        @user.password = 'aaaAAA'
        @user.password_confirmation = 'aaaAAA'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
  
      it 'パスワードが数字のみでは登録できない' do
        @user.password = "000000"
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
  
      it 'パスワードが6文字以下では登録できない' do
        @user.password = '000aa'
        @user.password_confirmation = '000aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      
      it 'パスワードとパスワード（確認用）の値が不一致だと登録できない。' do
        @user.password = '123aaa'
        @user.password_confirmation = '123aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      
      it '名字が空では登録できない' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      
      it '名字が、全角（漢字・ひらがな・カタカナ）以外では登録できない' do
        @user.last_name = "A０"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      
      it '名前が空では登録できない' do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end

      it '名前が、全角（漢字・ひらがな・カタカナ）以外では登録できない' do
        @user.last_name = "A０"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
  
      it '名字（フリガナ）の入力が無いと登録できない' do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
  
      it '名字（フリガナ）は、全角（カタカナ）以外では登録できない' do
        @user.first_name_kana = "ab0ｵ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
  
      it '名前（フリガナ）は、全角（カタカナ）以外では登録できない' do
        @user.last_name_kana = "ab0ｵ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
  
      it '生年月日の入力が無いと登録できない' do
        @user.birth = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth can't be blank")
      end
    end
  end
end