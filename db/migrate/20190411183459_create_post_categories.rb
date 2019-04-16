class CreatePostCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :post_categories do |t|
      t.string :tittle, null: false, uniq: true, limit: 100
      t.boolean :active, default: 1
      t.integer :position, default: 0

      t.timestamps
    end
  end
end
