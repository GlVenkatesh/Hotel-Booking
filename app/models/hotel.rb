class Hotel < ApplicationRecord
  has_one_attached :hotel_image
  belongs_to :city
  has_many :rooms
end
