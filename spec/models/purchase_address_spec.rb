require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end

    describe '商品購入情報の保存' do
        context '商品購入情報の保存がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_address).to be_valid
      end

      it 'building_nameは空でも保存できること' do
        @purchase_address.building_name = nil
        expect(@purchase_address).to be_valid
      end
    end

    context '商品購入情報の保存がうまくいいかないとき' do
      it 'postal_codeが空だと保存できないこと' do
        @purchase_address.postal_code = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeにハイフンが無いと保存できないこと' do
        @purchase_address.postal_code = "1234567"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it 'prefecturesが空では保存できないこと' do
        @purchase_address.prefectures = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefectures can't be blank")
      end

      it 'prefecturesが1の時では保存できないこと' do
        @purchase_address.prefectures = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefectures must be other than 1")
      end

      it 'municipalityが空では保存できないこと' do
        @purchase_address.municipality = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Municipality can't be blank")
      end

      it 'house_numberが空だと保存できないこと' do
        @purchase_address.house_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numberが空だと保存できないこと' do
        @purchase_address.phone_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが12桁以上だと保存できないこと' do
        @purchase_address.phone_number = "090123456789"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
