class CreatePageWorkHistoryAssociations < ActiveRecord::Migration
  def change
    create_table :page_work_history_associations do |t|
      t.belongs_to :page
      t.belongs_to :work_history

      t.timestamps
    end
  end
end
