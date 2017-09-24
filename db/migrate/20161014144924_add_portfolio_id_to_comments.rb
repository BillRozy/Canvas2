class AddPortfolioIdToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :portfolio_id, :integer
  end
end
