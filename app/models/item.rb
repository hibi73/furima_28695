class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :burden
  belongs_to_active_hash :region
  belongs_to_active_hash :days

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category
    validates :status
    validates :burden
    validates :region
    validates :days
    validates :price, numericality: { only_integer: true,greater_than: 300, less_than: 9999999}
  end

end
