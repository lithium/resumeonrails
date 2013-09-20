class CreatePageSkillAssociations < ActiveRecord::Migration
  def change
    create_table :page_skill_associations do |t|
      t.belongs_to :page
      t.belongs_to :skill
      t.integer :position, default: 9

      t.timestamps
    end
  end
end
