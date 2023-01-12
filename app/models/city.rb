class City < ApplicationRecord
    has_one_attached :city_image
    has_many :hotels
end
