class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :description
      t.integer :views
      t.integer :album_id

      t.timestamps
    end
    add_index :photos, :album_id
  end
end