class TaTriaVimata < ActiveRecord::Migration[5.2]
  def change
    add_column :pages, :position, :integer, default: 0
    add_column :pages, :menu, :boolean, default: 1
    rename_column :pages, :homepage, :home_page
  end
end
