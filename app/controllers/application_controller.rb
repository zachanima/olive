class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :find_pages

  private
  def find_pages
    @pages = Page.all
  end
end
