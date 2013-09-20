class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string    :slug, unique: true
      t.text      :header
      
      t.timestamps
    end
  end
end
