class PopulateCategories < ActiveRecord::Migration[5.2]
  def change
    [
      'Foods & Delicacies', 'Real Estate', 'Books & Magazines', 
      'Electronics', 'Cars & Vehicles', 'Others'
    ].each do |c|
      Category.create(name: c)
    end
  end
end
