class SectionsController < ApplicationController
  http_basic_authenticate_with name: 'foo', password: 'bar'
  before_filter :find_page

  def new
    @section = @page.sections.build
    render partial: 'form', layout: nil
  end

  def edit
    @section = @page.sections.find(params[:id])
    render partial: 'form', layout: nil
  end

  def create
    @section = @page.sections.build(params[:section])

    if @section.save
      redirect_to @page, notice: 'Section was successfully created.'
    else
      render action: :new
    end
  end

  def update
    @section = @page.sections.find(params[:id])

    if @section.update_attributes(params[:section])
      redirect_to @page, notice: 'Section was successfully updated.'
    else
      render action: :edit
    end
  end

  def destroy
    @section = @page.sections.find(params[:id])
    @section.destroy

    redirect_to @page
  end

  private
  def find_page
    @page = Page.find(params[:page_id])
  end
end
