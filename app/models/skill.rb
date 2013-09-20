class Skill < ActiveRecord::Base

  validates :name, uniqueness: true, presence: true
end
