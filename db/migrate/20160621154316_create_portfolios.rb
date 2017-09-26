class CreatePortfolios < ActiveRecord::Migration[5.0]
  def change
    create_table :portfolios do |t|
      t.integer :user_id
      t.string :description
      t.timestamps null: false
    end
  end
end
