require 'test_helper'

class WorkHistoryTest < ActiveSupport::TestCase
  test "don't save without company" do
    work_history = WorkHistory.new
    work_history.position = "Pencil Pusher"
    work_history.start_date = Date.new(2001,1,1)
    refute work_history.save, "Saved a WorkHistory without company"
  end

  test "don't save without position" do
    work_history = WorkHistory.new
    work_history.company = "Acme"
    work_history.start_date = Date.new(2001,1,1)
    refute work_history.save, "Saved a WorkHistory without a position"
  end

  test "don't save without start_date" do
    work_history = WorkHistory.new
    work_history.company = "Acme"
    work_history.position = "Pencil Pusher"
    refute work_history.save, "Saved a WorkHistory without a start_date"
  end

  test "don't save with overlapping dates" do
    first_work_history = WorkHistory.create(company: "Acme", 
                       position: "Pencil Puser", 
                       start_date: Date.new(2001,1,1), 
                       end_date: Date.new(2002,1,1))
    assert first_work_history.valid?, "Couldn't create a basic WorkHistory"

    work_history = WorkHistory.new
    work_history.update(:company => "Globocorp", 
                        :position => "V.P. in charge of Paradigms",
                        :start_date => Date.new(2001,4,1))
    refute work_history.save, "Saved a WorkHistory with overlapping dates"

    first_work_history.update(:start_date => Date.new(2001,1,15))
    assert first_work_history.save, "Failed to update a WorkHistory's start_date within it's own range"

  end
end
