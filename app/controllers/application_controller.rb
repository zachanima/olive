class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :find_pages

  private
  def find_page
    @page = Page.find(params[:page_id] || params[:id])
  end

  def find_pages
    @pages = Page.all
  end
end
