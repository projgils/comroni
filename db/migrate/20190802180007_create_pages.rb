class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.string :title
      t.text :description
      t.text :content
      t.string :image_url
      t.string :slug
      t.datetime :published_at

      t.timestamps
    end
  end
end
