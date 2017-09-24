class AddColumnAuthorNameToVideographies < ActiveRecord::Migration[5.0]
  def change
    add_column :videographies, :author_name, :string
    remove_column :videographies, :image
  end
end
