class PageSampleAssociation < ActiveRecord::Base
  belongs_to :page
  belongs_to :sample

  default_scope { order('position ASC') }

  validates_presence_of :page, :sample
  validates :position, numericality: { only_integer: true }, :inclusion => {:in => 1..9}

end
