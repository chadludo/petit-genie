class RemovePictureFromLists < ActiveRecord::Migration[6.0]
  def change
    remove_column :lists, :picture
  end
end
