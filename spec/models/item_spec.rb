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

    it 'が空では保存できないこと' do
      
    end

    it 'が空では保存できないこと' do
      
    end

    it 'が空では保存できないこと' do
     
    end
  end
  
end