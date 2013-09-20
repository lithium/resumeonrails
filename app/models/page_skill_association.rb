class PageSkillAssociation < ActiveRecord::Base
  belongs_to :page
  belongs_to :skill

  default_scope { order('position ASC') }

  validates_presence_of :page, :skill
  validates :position, numericality: { only_integer: true }, :inclusion => {:in => 1..9}
end
