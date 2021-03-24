require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録できるとき' do
      it 'passwordが6文字以上であれば登録できること' do
        @user.password = 'abc1234'
        @user.password_confirmation = 'abc1234'
        expect(@user).to be_valid
      end
    end
    context 'ユーザー新規登録ができない時' do
      it 'emailが空では登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが半角数字のみでは登録できないこと' do
        @user.password = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 半角英数字混合で入力してください")
      end

      it 'passwordが半角英字のみでは登録できないこと' do
        @user.password = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 半角英数字混合で入力してください")
      end

      it 'passwordが全角の場合は登録できないこと' do
        @user.password = '１２３４５６７'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 半角英数字混合で入力してください")
      end

      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = 'abc1234'
        @user.password_confirmation = 'abc1233'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '重複したemailが存在する場合登録できないこと(一意性)' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'family_nameが空では登録できないこと' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it 'first_nameが空では登録できないこと' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'family_name_kanaが空では登録できないこと' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end

      it 'first_name_kanaが空では登録できないこと' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'family_nameが全角（漢字・ひらがな・カタカナ）でないと登録できないこと' do
        @user.family_name = '123aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name 全角（漢字・ひらがな・カタカナ)でを入力してください")
      end

      it 'first_nameが全角（漢字・ひらがな・カタカナ）でないと登録できないこと' do
        @user.first_name = '123aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角（漢字・ひらがな・カタカナ)でを入力してください")
      end
      
      it 'family_name_kanaが全角（カタカナ）でないと登録できないこと' do
        @user.family_name_kana = '123aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana 全角(カタカナ)のみで入力して下さい")
      end

      it 'first_name_kanaが全角（カタカナ）でないと登録できないこと' do
        @user.first_name_kana = '123aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角(カタカナ)のみで入力して下さい")
      end
    end
  end
end