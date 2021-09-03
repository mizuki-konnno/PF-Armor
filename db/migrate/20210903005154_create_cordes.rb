class CreateCordes < ActiveRecord::Migration[5.2]
  def change
    create_table :cordes do |t|
      t.text :title
      t.string :corde_image_id
      t.text :caption
      t.integer :user_id

      t.timestamps
    end
  end
end
