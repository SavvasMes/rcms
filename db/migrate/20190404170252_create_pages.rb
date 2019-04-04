class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.string :title, null: false, uniq: true, limit: 100
      t.boolean :draft, default: 0
      t.string :meta_title
      t.text :meta_keyword
      t.text :meta_description
      t.text :content

      t.timestamps
    end
  end
end
