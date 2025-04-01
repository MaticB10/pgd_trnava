class RemoveGalleryCategoryIdFromGalerijas < ActiveRecord::Migration[8.0]
  def change
    remove_column :galerijas, :gallery_category_id, :bigint
  end
end
