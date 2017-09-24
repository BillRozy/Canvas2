class AddPortfolioIdToComments < ActiveRecord::Migration[5.0]
    add_column :comments, :portfolio_id, :integer
  end
end
