class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :picture
      t.string :url
      t.float :price
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
