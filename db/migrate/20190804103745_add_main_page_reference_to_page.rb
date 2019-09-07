class AddMainPageReferenceToPage < ActiveRecord::Migration[5.2]
  def change
  	add_column :pages, :main_page_id, :integer
  end
end
