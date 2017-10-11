class AddImageDataToListings < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :image_data, :text
  end
end
