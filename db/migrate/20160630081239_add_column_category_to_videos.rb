class AddColumnCategoryToVideos < ActiveRecord::Migration[5.0]
  def change
    add_column :videos, :category, :string
  end
end
