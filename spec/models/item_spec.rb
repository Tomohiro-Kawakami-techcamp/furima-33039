require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it "全て記入すれば登録できること" do
      expect(@item).to be_valid
    end

    it "imageが空では登録できないこと" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "nameが空では登録できないこと" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "infoが空では登録できないこと" do
      @item.info = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Info can't be blank")
    end

    it "priceが空では登録できないこと" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "priceが300円未満であれば登録できないこと" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end

    it "priceが100万円以上であれば登録できないこと" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end

    it "priceが全角数字であれば登録できないこと" do
      @item.price = "５００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Half-width number")
    end

    it "priceが数字以外であれば登録できないこと" do
      @item.price = "abc"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Half-width number")
    end

    it "priceが半角英数混合では登録できないこと" do
      @item.price = "100ab"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Half-width number")
    end

    it "category_idが未選択であれば登録できないこと" do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Category Select")
    end

    it "sales_status_idが未選択であれば登録できないこと" do
      @item.sales_status_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Sales status Select")
    end

    it "shipping_fee_status_idが未選択であれば登録できないこと" do
      @item.shipping_fee_status_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee status Select")
    end
      
    it "prefecture_idが未選択であれば登録できないこと" do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture Select")
    end

    it "scheduled_delivery_idが未選択であれば登録できないこと" do
      @item.scheduled_delivery_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Scheduled delivery Select")
    end
  end
end