class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :comments
  has_one :purchase
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :burden
  belongs_to_active_hash :region
  belongs_to_active_hash :days

  def self.search(search)
    if search != ""
      Item.where('text LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id, numericality: { other_than: 1 } 
    validates :status_id, numericality: { other_than: 1 } 
    validates :burden_id, numericality: { other_than: 1 } 
    validates :region_id, numericality: { other_than: 1 } 
    validates :days_id, numericality: { other_than: 1 } 
    validates :price, numericality: { only_integer: true,greater_than: 300, less_than: 9999999}
  end

end
