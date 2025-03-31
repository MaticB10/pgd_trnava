# app/models/galerija.rb
class Galerija < ApplicationRecord
  has_many_attached :images
end
