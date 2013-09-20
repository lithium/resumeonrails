require 'test_helper'

class PageTest < ActiveSupport::TestCase
  test "don't save without a slug" do
    page = Page.new
    refute page.save, "Saved a page without a name!"
  end

  test "ensure slug uniqueness" do
    slug = "/"
    Page.create(:slug => slug)
    page = Page.new
    page.slug = slug
    refute page.save, "Saved a page with a duplicate slug!"
  end
end
