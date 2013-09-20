class Skill < ActiveRecord::Base

  validates :name, uniqueness: true, presence: true

  rails_admin do 
    edit do
      field :name
      field :description, :ck_editor
    end
  end

end
