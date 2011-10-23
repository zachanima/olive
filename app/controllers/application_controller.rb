class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :find_pages
  before_filter :find_site
  before_filter :find_links

  private
  def find_page
    @page = Page.find(params[:page_id] || params[:id])
  end

  def find_pages
    @pages = Page.all
  end

  def find_links
    @links = Link.all
  end

  def find_site
    @site = Site.first
  end
end
