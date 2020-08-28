require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '商品購入情報の保存' do
    before do
      
      @purchase_address = FactoryBot.build(:purchase_address)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@purchase_address).to be_valid
    end

    it 'tokenが空だと保存できないこと' do
    end

    it 'postal_codeが空だと保存できないこと' do
    end

    it 'postal_codeにハイフンが無いと保存できないこと' do
    end

    it 'prefecturesが空では保存できないこと' do
    end

    it 'prefecturesが1の時では保存できないこと' do
    end

    it 'nicknameが半角でないと保存できないこと' do
    end

    it 'municipalityが空だと保存できないこと' do
    end

    it 'house_numberが空だと保存できないこと' do
    end

    it 'building_nameは空でも保存できること' do
    end

    it 'phone_numberが空だと保存できないこと' do
    end

    it 'phone_numberが12桁以上だと保存できないこと' do
    end

  end
end
