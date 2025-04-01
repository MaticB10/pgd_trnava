class AddDescriptionToGalerijas < ActiveRecord::Migration[8.0]
  def change
    add_column :galerijas, :description, :text
  end
end
