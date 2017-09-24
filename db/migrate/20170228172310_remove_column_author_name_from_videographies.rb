class RemoveColumnAuthorNameFromVideographies < ActiveRecord::Migration[5.0]
  def change
    remove_column :videographies, :author_name
  end
end
