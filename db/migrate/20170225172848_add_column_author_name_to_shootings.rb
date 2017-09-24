class AddColumnAuthorNameToShootings < ActiveRecord::Migration[5.0]
  def change
    add_column :shootings, :author_name, :string
    remove_column :shootings, :image
  end
end
