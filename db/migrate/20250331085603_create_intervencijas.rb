class CreateIntervencijas < ActiveRecord::Migration[8.0]
  def change
    unless table_exists?(:intervencijas)
      create_table :intervencijas do |t|
        t.datetime :datum
        t.string :lokacija
        t.string :tip
        t.text :kratek_opis
        t.text :podrobnejsi_opis

        t.timestamps
      end
    end
  end
end
