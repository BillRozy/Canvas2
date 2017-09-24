class AddColumnOperatorToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :operator, :boolean
  end
end
