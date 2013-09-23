class PagesController < ApplicationController

  def page
    slug = "/#{params[:slug]}"
    @current_page = Page.find(:first, :conditions => ["lower(slug) = ?", slug.downcase])
    raise ActionController::RoutingError.new('Page Not Found') unless @current_page

    layout = @current_page.layout
    layout = "resume" if layout.empty? or !layout 


    render layout: layout
  end
end
