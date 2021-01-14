require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe "ユーザー新規登録" do
    context 'ユーザー新規登録ができる場合' do
      it "nicknameとemail、passwordとpassword_confirmation、全てのname、birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end
    
    context 'ユーザー新規登録ができない場合' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
   
    
    
    it "first_name_kanaが空だと登録できない" do
      @user.first_name_kana= ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "last_name_kanaが空だと登録できない" do
      @user.last_name_kana= ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it "first_name_kanaがひらがなだと登録できない" do
      @user.first_name_kana= "たろう"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters")
    end
    it "first_name_kanaが漢字だと登録できない" do
      @user.first_name_kana= "太朗"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters")
    end
    it "last_name_kanaがひらがなだと登録できない" do
      @user.last_name_kana= "たなか"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana Full-width katakana characters")
    end
    it "last_name_kanaが漢字だと登録できない" do
      @user.last_name_kana= "田中"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana Full-width katakana characters")
    end
    it "first_nameが空だと登録できない" do
      @user.first_name= ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name Full-width characters")
    end
    it "last_nameが空だと登録できない" do
      @user.last_name= ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name Full-width characters")
    end
    it "birthdayが空だと登録できない" do
      @user.birthday= ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
    it "passwordが6文字以上でないと登録できないこと" do
      @user.password= "ta214"
      @user.password_confirmation="ta214"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordは英語のみでは登録できないこと" do
      @user.password= "kanagawa"
      @user.password_confirmation="kanagawa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password 半角英数字で入力してください")
    end
    it "passwordは数字のみでは登録できないこと" do
      @user.password= "123456"
      @user.password_confirmation="123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password 半角英数字で入力してください")
    end
    it "passwordは全角では登録できないこと" do
      @user.password= "ＡＡＡＡＡ２４"
      @user.password_confirmation="ＡＡＡＡＡ２４"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password 半角英数字で入力してください")
    end

    it "passwordとpassword_confirmationは値が同じでないと登録できないこと" do
      @user.password= "ta2142"
      @user.password_confirmation="ta2143"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    end

    it "emailが@を含むこと" do
      @user.email="1234gmail.com" 
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "emailが一意性であること" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
 end
end
