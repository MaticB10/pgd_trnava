class CreateGalerijas < ActiveRecord::Migration[8.0]
  def change
    unless table_exists?(:galerijas)
      create_table :galerijas do |t|
        t.bigint :gallery_category_id

        t.timestamps
      end
    end
  end
end
