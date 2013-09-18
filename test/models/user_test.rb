require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not save without an email" do
    user = User.new
    assert !user.save, "Saved a user without an email"
  end
end
