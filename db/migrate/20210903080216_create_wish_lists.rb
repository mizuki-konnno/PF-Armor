class CreateWishLists < ActiveRecord::Migration[5.2]
  def change
    create_table :wish_lists do |t|
      t.text :title
      t.string :wish_list_image_id
      t.text :brand
      t.integer :user_id

      t.timestamps
    end
  end
end
