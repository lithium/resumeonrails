require 'test_helper'

class PageSkillAssociationTest < ActiveSupport::TestCase
  test "don't save without foreign keys" do
    page = Page.create(:slug => "/")
    skill = Skill.create(:name => "Sleeping")
    psa = PageSkillAssociation.new
    refute psa.save, "Saved a PageSkillAssociation without any foreign keys!"

    psa.page = page
    refute psa.save, "Saved a PageSkillAssociation without a skill!"

    psa.skill = skill
    psa.page = nil
    refute psa.save, "Saved a PageSkillAssociation without a page!"

    psa.page = page
    psa.skill = skill
    assert psa.save, "Couldn't save a PageSkillAssociation!"
  end

  test "ensure valid position" do
    page = Page.create(:slug => "/")
    skill = Skill.create(:name => "Sleeping")
    refute PageSkillAssociation.create(:page => page, :skill => skill, :position => -1).valid?, "Saved a PageSkillAssociation with invalid position"
    refute PageSkillAssociation.create(:page => page, :skill => skill, :position => 10).valid?, "Saved a PageSkillAssociation with invalid position"
    refute PageSkillAssociation.create(:page => page, :skill => skill, :position => 4.5).valid?, "Saved a PageSkillAssociation with a float position"
  end


end
