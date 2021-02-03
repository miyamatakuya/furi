require 'rails_helper'

RSpec.describe UserFurima, type: :model do
  describe 'フリマ情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @user_furima = FactoryBot.build(:user_furima, user_id: @user.id , item_id: @item.id)
      sleep(1)
    end

    context '全ての値が入力できる場合' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user_furima).to be_valid
    end
    it '建物が空でも購入できる場合' do
      @user_furima.building_name = ""
      @user_furima.valid?
      expect(@user_furima).to be_valid
    end
  end

  context '全ての値が入力できない場合' do
    it '郵便番号が空だと保存できないこと' do
      @user_furima.postal_code = ""
      @user_furima.valid?
      expect(@user_furima.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号にハイフンがないと保存できないこと' do
      @user_furima.postal_code = "1111111"
      @user_furima.valid?
      expect(@user_furima.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it '都道府県が空だと保存できないこと' do
      @user_furima.area_id = ""
      @user_furima.valid?
      expect(@user_furima.errors.full_messages).to include("Area can't be blank")
    end
    it '都道府県が1だと保存できないこと' do
      @user_furima.area_id = 1
      @user_furima.valid?
      expect(@user_furima.errors.full_messages).to include("Area can't be blank")
    end

    it '市区町村が空だと保存できないこと' do
      @user_furima.city = ""
      @user_furima.valid?
      expect(@user_furima.errors.full_messages).to include("City can't be blank")
    end
    

    it '番地が空だと保存できないこと' do
      @user_furima.address = ""
      @user_furima.valid?
      expect(@user_furima.errors.full_messages).to include("Address can't be blank")
    end
    it '電話番号が空だと保存できないこと' do
      @user_furima.phone_number = ""
      @user_furima.valid?
      expect(@user_furima.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号がハイフンが不要で11桁いないで無いと保存できないこと' do
      @user_furima.phone_number = "111111111111"
      @user_furima.valid?
      expect(@user_furima.errors.full_messages).to include("Phone number is invalid. ")
    end

    it '電話番号がハイフンが含まれていれば保存できないこと' do
      @user_furima.phone_number = "111-11111-1111"
      @user_furima.valid?
      expect(@user_furima.errors.full_messages).to include("Phone number is invalid. ")
    end
    
    it 'item_idが空だと保存できないこと' do
      @user_furima.item_id = ""
      @user_furima.valid?
      expect(@user_furima.errors.full_messages).to include("Item can't be blank")
    end
    it 'user_idが空だと保存できないこと' do
      @user_furima.user_id = ""
      @user_furima.valid?
      expect(@user_furima.errors.full_messages).to include("User can't be blank")
    end

    it "tokenが空では登録できないこと" do
      @user_furima.token = nil
      @user_furima.valid?
      expect(@user_furima.errors.full_messages).to include("Token can't be blank")
      
   end
  end

  end
end