class RemovePictureFromProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :picture
  end
end
