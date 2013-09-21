class PagesController < ApplicationController

  def page
    slug = "/#{params[:slug]}"
    @current_page = Page.find_by slug: slug
    raise ActionController::RoutingError.new('Page Not Found') unless @current_page

    layout = @current_page.layout ? @current_page.layout : "resume"


    render layout: layout
  end
end
