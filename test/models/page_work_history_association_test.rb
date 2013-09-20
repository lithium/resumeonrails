require 'test_helper'

class PageWorkHistoryAssociationTest < ActiveSupport::TestCase
  test "don't save without foreign keys" do
    page = Page.create(:slug => "/")
    work_history = WorkHistory.create(:company => "Acme", :position => "Pencil Pusher", :start_date => Date.new(2001,1,1))
    pwha = PageWorkHistoryAssociation.new
    refute pwha.save, "Saved a PageWorkHistoryAssociation without any foreign keys!"

    pwha.page = page
    refute pwha.save, "Saved a PageWorkHistoryAssociation without a WorkHistory!"

    pwha.work_history = work_history
    pwha.page = nil
    refute pwha.save, "Saved a PageWorkHistoryAssociation without a page!"

    pwha.work_history = work_history
    pwha.page = page
    assert pwha.save, "Couldn't save a PageWorkHistoryAssociation!"
  end


end
