class AddColumnOperatorToUsers < ActiveRecord::Migration
  def change
    add_column :users, :operator, :boolean
  end
end
