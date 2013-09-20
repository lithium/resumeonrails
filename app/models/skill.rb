class Skill < ActiveRecord::Base
  # has_many :page_skill_associations, :dependent => :delete_all
  # has_many :pages, :through => :page_skill_associations
  
  default_scope { order('ordering ASC') }

  validates :name, uniqueness: true, presence: true
  validates :ordering, numericality: { only_integer: true }, :inclusion => {:in => 1..9}
end
