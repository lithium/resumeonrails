require 'test_helper'

class PageSampleAssociationTest < ActiveSupport::TestCase
  test "don't save without foreign keys" do
    page = Page.create(:slug => "/")
    sample = Sample.create(:name => "Sleeping")
    psa = PageSampleAssociation.new
    refute psa.save, "Saved a PageSampleAssociation without any foreign keys!"

    psa.page = page
    refute psa.save, "Saved a PageSampleAssociation without a Sample!"

    psa.sample = sample
    psa.page = nil
    refute psa.save, "Saved a PageSampleAssociation without a page!"

    psa.page = page
    psa.sample = sample
    assert psa.save, "Couldn't save a PageSampleAssociation!"
  end

  test "ensure valid position" do
    page = Page.create(:slug => "/")
    sample = Sample.create(:name => "Sleeping")
    refute PageSampleAssociation.create(:page => page, :sample => sample, :position => -1).valid?, "Saved a PageSampleAssociation with invalid position"
    refute PageSampleAssociation.create(:page => page, :sample => sample, :position => 10).valid?, "Saved a PageSampleAssociation with invalid position"
    refute PageSampleAssociation.create(:page => page, :sample => sample, :position => 4.5).valid?, "Saved a PageSampleAssociation with a float position"
  end
end
