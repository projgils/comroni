class AddSponsorAttributesToPages < ActiveRecord::Migration[5.2]
  def change
    add_column :pages, :sponsor, :datetime
    add_column :pages, :sponsor_due, :datetime
  end
end
