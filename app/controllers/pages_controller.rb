class PagesController < ApplicationController
  before_filter :find_page, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with name: 'foo', password: 'bar', except: [:show, :home]

  # def show

  def new
    @page = Page.new
  end

  def edit
    render layout: nil
  end

  def create
    @page = Page.new(params[:page])

    if @page.save
      redirect_to @page, notice: 'Page was successfully created.'
    else
      render action: :new
    end
  end

  def update
    if @page.update_attributes(params[:page])
      redirect_to @page, notice: 'Page was successfully updated.'
    else
      render action: :edit
    end
  end

  def destroy
    @page.destroy

    redirect_to pages_url
  end

  def home
    if Page.count == 0
      render text: 'Not Found', status: :not_found
    else
      redirect_to Page.first
    end
  end

  def sort
    Page.all.each do |page|
      page.position = params['page'].index(page.id.to_s)
      page.save
    end
    render nothing: true
  end
end
