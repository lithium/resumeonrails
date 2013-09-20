class PageSkillAssociation < ActiveRecord::Base
  belongs_to :page
  belongs_to :skill

  default_scope { order(:position) }
end
