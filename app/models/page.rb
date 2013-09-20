class Page < ActiveRecord::Base
  has_many :page_skill_associations, :dependent => :delete_all
  has_many :skills, :through => :page_skill_associations

  rails_admin do 
    configure :page_skill_associations do
      visible(false)
    end

    configure :skills do
      orderable(true)
    end
  end

  def skill_ids=(ids)
    unless (ids = ids.map(&:to_i).select { |i| i>0 }) == (current_ids = page_skill_associations.map(&:skill_id))
      (current_ids - ids).each { |id| page_skill_associations.select{|b|b.skill_id == id}.first.mark_for_destruction }
      ids.each_with_index do |id, index|
        if current_ids.include? (id)
          psa = page_skill_associations.select { |b| b.skill_id == id }.first
          psa.position = (index+1)
          psa.save
        else
          psa = PageSkillAssociation.create
          psa.page = self
          psa.skill_id = id
          psa.position = index+1
          psa.save
        end
      end
    end
  end


  
end
