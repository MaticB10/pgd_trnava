class Galerija < ApplicationRecord
  belongs_to :gallery_category
  has_many_attached :images

  before_validation :set_default_gallery_category, on: :create

  private

  def set_default_gallery_category
    self.gallery_category_id ||= 1
  end
end
