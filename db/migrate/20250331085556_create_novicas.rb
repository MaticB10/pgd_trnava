class CreateNovicas < ActiveRecord::Migration[8.0]
  def change
    unless table_exists?(:novicas)
      create_table :novicas do |t|
        t.string :naslov
        t.text :vsebina
        t.datetime :datum

        t.timestamps
      end
    end
  end
end
