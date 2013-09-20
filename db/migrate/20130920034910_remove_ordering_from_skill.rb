class RemoveOrderingFromSkill < ActiveRecord::Migration
  def change
    remove_column :skills, :ordering, :integer
  end
end
