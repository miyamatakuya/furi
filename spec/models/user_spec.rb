require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe "ユーザー新規登録" do
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
 end
end
