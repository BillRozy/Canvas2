class AddColumnCategoryToPhoto < ActiveRecord::Migration[5.0]
  def change
    add_column :photos, :category, :string
  end
end
