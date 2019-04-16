class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false, uniq: true
      t.text :content
      t.references :post_category
      t.timestamps
    end
  end
end
