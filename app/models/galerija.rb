class Galerija < ApplicationRecord
  # Odstranite povezavo do kategorij, če je ne potrebujete
  # belongs_to :gallery_category

  has_many_attached :images

  # Odstranite callback, ker ga ne potrebujete več
  # before_validation :set_default_gallery_category, on: :create

  # Če želite še kdaj uporabiti kategorije, lahko ta callback zakomentirate
  # private
  #
  # def set_default_gallery_category
  #   self.gallery_category_id ||= 1
  # end
end
