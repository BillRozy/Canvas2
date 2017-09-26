class CreateVideographies < ActiveRecord::Migration[5.0]
  def change
    create_table :videographies do |t|
      t.string :category
      t.float :price
      t.string :description
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
