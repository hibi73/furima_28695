class Address < ApplicationRecord
  belongs_to :purchase

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefectures, numericality: { other_than: 1 }
    validates :municipality
    validates :house_number
    validates :phone_number, format: {with: /^(0{1}\d{9,10})$/}
  end
end
