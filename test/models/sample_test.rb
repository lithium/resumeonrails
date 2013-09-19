require 'test_helper'

class SampleTest < ActiveSupport::TestCase
  test "don't save without a name" do
    sample = Sample.new
    sample.description = "My Own NiH ORM!!!1"
    refute sample.save, "Saved a Sample without a name!"
  end

  test "ensure name uniqueness" do
    name = "Common Name"
    Sample.create(:name => name)
    sample = Sample.new
    sample.name = name
    refute sample.save, "Saved a Sample with a duplicate name!"
  end

  test "ensure url validation" do
    assert Sample.create(:name => "One").valid?, "Couldn't save a Sample with an empty url!"
    refute Sample.create(:name => "Two", :source_url => "waka").valid?, "Saved a Sample with an invalid source_url!"
    assert Sample.create(:name => "Three", :source_url => "https://github.com/").valid?, "Couldn't save a Sample with a valid source_url!"
    assert Sample.create(:name => "four", :source_url => "").valid?, "Unable to save a Sample with an empty string for source_url!"
  end

end
