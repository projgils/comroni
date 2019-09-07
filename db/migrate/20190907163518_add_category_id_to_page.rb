class AddCategoryIdToPage < ActiveRecord::Migration[5.2]
  def change
    add_column :pages, :category_id, :integer
  end
end
