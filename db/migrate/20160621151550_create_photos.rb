class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.string :title
      t.string :path
      t.string :image
      t.string :category
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
