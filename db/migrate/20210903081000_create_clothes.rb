class CreateClothes < ActiveRecord::Migration[5.2]
  def change
    create_table :clothes do |t|
      t.text :title
      t.string :clothes_image_id
      t.text :brand
      t.integer :user_id
      t.text :caption
      t.integer :genre_id
      t.timestamps
    end
  end
end
