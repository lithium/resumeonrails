class PageWorkHistoryAssociation < ActiveRecord::Base
  belongs_to :page
  belongs_to :work_history

  validates_presence_of :page, :work_history

end
