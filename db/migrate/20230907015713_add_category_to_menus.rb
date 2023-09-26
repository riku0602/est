class AddCategoryToMenus < ActiveRecord::Migration[6.1]
  def change
    add_column :menus, :category, :string
  end
end
