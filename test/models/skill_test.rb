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


end
