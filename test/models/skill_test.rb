require 'test_helper'

class SkillTest < ActiveSupport::TestCase
  test "don't save without name" do
    skill = Skill.new
    skill.description = "I can totally dance too"
    refute skill.save, "Saved a Skill without a name!"
  end

  test "ensure name uniqueness" do
    name = "Common Name"
    Skill.create(:name => name)
    skill = Skill.new
    skill.name = name
    refute skill.save, "Saved a Skill with a duplicate name!"
  end

  test "ensure valid ordering" do
    refute Skill.create(:name => "Sleeping", :ordering => -1).valid?, "Saved a Skill with invalid ordering"
    refute Skill.create(:name => "Sleeping", :ordering => 10).valid?, "Saved a Skill with invalid ordering"
    refute Skill.create(:name => "Sleeping", :ordering => 4.5).valid?, "Saved a Skill with a float ordering"
  end

  test "ensure default sort order" do
    Skill.create(:name => "Second", :ordering => 2)
    Skill.create(:name => "First", :ordering => 1)
    assert Skill.all.first.name == "First", "Skills not ordered by 'ordering' field!"
  end

end
