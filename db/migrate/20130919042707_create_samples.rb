class CreateSamples < ActiveRecord::Migration
  def change
    create_table :samples do |t|
      t.string :name, unique: true
      t.string :platform
      t.string :source_url
      t.text :description

      t.timestamps
    end
  end
end
