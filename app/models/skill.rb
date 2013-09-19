class Skill < ActiveRecord::Base
  default_scope { order('ordering ASC') }

  validates :name, uniqueness: true, presence: true
  validates :ordering, numericality: { only_integer: true }, :inclusion => {:in => 1..9}
end
