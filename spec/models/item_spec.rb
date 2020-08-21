require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end

    it 'image,name,description,category_id,status_id,burden_id,region_id,days_id,priceが存在していれば保存できること' do
      expect(@item).to be_valid
    end

    it 'imageが空では保存できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'nameが空では保存できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'descriptionが空では保存できないこと' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'category_idが空では保存できないこと' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it 'category_idが1のとき保存できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it 'status_idが空では保存できないこと' do
      @item.status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end

    it 'status_idが1の時では保存できないこと' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1")
    end

    it 'burden_idが空では保存できないこと' do
      @item.burden_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Burden can't be blank")
    end

    it 'burden_idが1の時では保存できないこと' do
      @item.burden_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Burden must be other than 1")
    end

    it 'region_idが空では保存できないこと' do
      @item.region_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Region can't be blank")
    end

    it 'region_idが1の時では保存できないこと' do
      @item.region_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Region must be other than 1")
    end

    it 'days_idが空では保存できないこと' do
      @item.days_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Days can't be blank")
    end

    it 'days_idが1の時では保存できないこと' do
      @item.days_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Days must be other than 1")
    end

    it 'priceが空では保存できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが300より小さいと保存できないこと' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than 300")
    end

    it 'priceが9999999より大きいと保存できないこと' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than 9999999")
    end

  end
  
end