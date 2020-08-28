class PurchaseAddress

  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefectures, :municipality, :house_number, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefectures, numericality: { other_than: 1 }
    validates :municipality
    validates :house_number
    validates :phone_number, format: {with: /\A\d{10,11}\z/}
  end

  def save
    purchase = Purchase.create!(user_id: user_id, item_id: item_id)
    Address.create!(postal_code: postal_code, prefectures: prefectures, municipality: municipality, house_number: house_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end

end