require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nickname,email、password,password_confirmation,last_name,first_name,last_name_kana,first_name_kana,birthdayが存在すれば登録できること" do
      expect(@user).to be_valid
    end

    it "passwordが6文字以上であれば登録できること" do
      @user.password = "abc123"
      @user.password_confirmation = "abc123"
      expect(@user).to be_valid
    end

    it "nicknameが空では登録できないこと" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "emailが@を含まない場合登録できないこと" do
      @user.email = "testgmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "abc12"
      @user.password_confirmation = "abc12"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordが半角英数字混合でなければ登録できないこと" do
      @user.password = "1234567"
      @user.password_confirmation = "1234567"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Complexity requirement not met.")
    end

    it "passwordが半角英字のみであれば登録できないこと" do
      @user.password = "aaaaaaa"
      @user.password_confirmation = "aaaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Complexity requirement not met.")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "last_nameが空では登録できないこと" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "last_nameが半角では登録できないこと" do
      @user.last_name = "yamada"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name は全角で入力してください。")
    end

    it "first_nameが空では登録できないこと" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "first_nameが半角では登録できないこと" do
      @user.first_name = "taro"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name は全角で入力してください。")
    end

    it "last_name_kanaが空では登録できないこと" do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it "last_name_kanaが全角カタカナでないと登録できないこと" do
      @user.last_name_kana = "山田"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana は全角カタカナで入力して下さい。")
    end

    it "first_name_kanaが空では登録できないこと" do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it "first_name_kanaが全角カタカナでないと登録できないこと" do
      @user.first_name_kana = "太郎"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana は全角カタカナで入力して下さい。")
    end

    it "birthdayが空では登録できないこと" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

  end
end
