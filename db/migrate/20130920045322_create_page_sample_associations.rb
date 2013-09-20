class CreatePageSampleAssociations < ActiveRecord::Migration
  def change
    create_table :page_sample_associations do |t|
      t.belongs_to :page
      t.belongs_to :sample
      t.integer :position, default: 9

      t.timestamps
    end
  end
end
