class AddSearchableTextToPage < ActiveRecord::Migration[5.2]
  def change
    add_column :pages, :searchable_text, :text
  end
end
