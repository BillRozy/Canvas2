class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.float :rating
      t.integer :user_id
      t.integer :portfolio_id

      t.timestamps null: false
    end
  end
end
