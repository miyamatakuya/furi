require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe "ユーザー新規登録" do
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
    it "category_idが空だと登録できない" do
      @item.category_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it "products_information_idが空だと登録できない" do
      @item.products_information_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Products information can't be blank")
    end

    it "bo_shipping_charges_idが空だと登録できない" do
      @item.bo_shipping_charges_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Bo shipping charges can't be blank")
    end

    it "area_idが空だと登録できない" do
      @item.area_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Area can't be blank")
    end
    
    it "estimated_shopping_date_idが空だと登録できない" do
      @item.estimated_shopping_date_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Estimated shopping date can't be blank")
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

  end


  pending "add some examples to (or delete) #{__FILE__}"
end
