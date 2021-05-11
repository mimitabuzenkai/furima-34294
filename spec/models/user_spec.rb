require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    it 'メールアドレスが必須であること' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'メールアドレスが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    
    it 'メールアドレスは、@を含む必要があること' do
      @user.email = 'nikuniku.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    
    it 'パスワードが必須であること' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'パスワードは、6文字以上での入力が必須であること' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'パスワードは、半角英数字混合での入力が必須であること（半角英数字が混合されていれば、登録が可能なこと）' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'パスワードとパスワード（確認用）、値の一致が必須であること' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'パスワードは、半角英数字混合での入力が必須であること（半角英数字が混合されていれば、登録が可能なこと）' do
      @user.password = "000aaa"
      @user.password_confirmation = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'ユーザー本名は、名字と名前がそれぞれ必須であること' do
      @user.password = "000aaa"
      @user.password_confirmation = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.first_name = "AAA"
      @user.last_name = "AAA"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid", "Last name is invalid")
    end

    it 'ユーザー本名のフリガナは、名字と名前がそれぞれ必須であること' do
      @user.first_name_kana = ""
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid", "Last name kana is invalid")
    end

    it 'ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること' do
      @user.first_name_kana = "あA"
      @user.last_name_kana = "あA"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid", "Last name kana is invalid")
    end

    it '生年月日が必須であること' do
      @user.birth = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth can't be blank")
    end
  end
end