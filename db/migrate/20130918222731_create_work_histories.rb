class CreateWorkHistories < ActiveRecord::Migration
  def change
    create_table :work_histories do |t|
      t.string :company
      t.string :position
      t.date :start_date, index: true
      t.date :end_date, null: true
      t.string :address
      t.text :contact_info
      t.text :description

      t.timestamps
    end
  end
end
