class CreateVideos < ActiveRecord::Migration[5.0]
    create_table :videos do |t|
      t.string :title
      t.string :path
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
