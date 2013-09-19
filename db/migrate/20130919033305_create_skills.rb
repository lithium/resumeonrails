class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name, unique: true
      t.text :description                 # html blob
      t.integer :ordering, default: 9     # to allow placement within skill set block

      t.timestamps
    end
  end
end
