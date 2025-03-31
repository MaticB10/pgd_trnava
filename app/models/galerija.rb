class Galerija < ApplicationRecord
    belongs_to :gallery_category
    has_many_attached :images  # Za nalaganje slik, ne pozabite namestiti Active Storage
  end
  