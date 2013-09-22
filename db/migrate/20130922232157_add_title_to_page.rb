class AddTitleToPage < ActiveRecord::Migration
  def up
    add_column :pages, :title, :string
  end

  def down
    remove_column :pages, :title
  end
end
