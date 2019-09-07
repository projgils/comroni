class AddAddressDetailsToPages < ActiveRecord::Migration[5.2]
  def change
    add_column :pages, :address_details, :string
  end
end
