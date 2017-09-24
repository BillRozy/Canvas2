class RemoveColumnAuthorNameFromShootings < ActiveRecord::Migration[5.0]
  def change
    remove_column :shootings, :author_name
  end
end
