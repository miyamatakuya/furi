require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "itemの出品テスト" do

    context 'itemの出品テストができる場合' do
      it "全てが正しく存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context 'itemの出品テストができない場合' do
    it "imageが空だと登録できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "nameが空だと登録できない" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it "explanationが空だと登録できない" do
      @item.explanation = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end
    it "category_idが1だと登録できない" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it "products_information_idが1だと登録できない" do
      @item.products_information_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Products information must be other than 1")
    end

    it "bo_shipping_charges_idが1だと登録できない" do
      @item.bo_shipping_charges_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Bo shipping charges must be other than 1")
    end

    it "area_idが1だと登録できない" do
      @item.area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Area must be other than 1")
    end
    
    it "estimated_shopping_date_idが1だと登録できない" do
      @item.estimated_shopping_date_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Estimated shopping date must be other than 1")
    end

    

    it "priceが空だと登録できない" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "priceが299だと登録できない" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it "priceが10000000だと登録できない" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end

    it "priceが半角数字じゃないと登録できない" do
      @item.price = "２３９"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it "priceが半角英数混合では登録できないこと" do
      @item.price = "２３４abc"
      @item.valid?
     expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it "priceが半角英語だけでは登録できないこと" do
      @item.price = "ABC"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
  end

  end


  pending "add some examples to (or delete) #{__FILE__}"
end
