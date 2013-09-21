class Skill < ActiveRecord::Base

  validates :name, uniqueness: true, presence: true

  rails_admin do 
    edit do
      fields :name, :description
    end

    list do
      fields :name
    end

  end

end
