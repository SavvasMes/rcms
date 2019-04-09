class AddHomepageToPages < ActiveRecord::Migration[5.2]
  def change
    add_column :pages, :homepage, :boolean,
               default: 0, after: :draft
  end
end
