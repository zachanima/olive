class SectionsController < ApplicationController
  http_basic_authenticate_with name: 'foo', password: 'bar'
  before_filter :find_page
  before_filter :find_section, only: [:show, :edit, :update, :destroy]

  # def show

  def new
    @section = @page.sections.build
    render layout: nil
  end

  # def edit

  def create
    @section = @page.sections.build(params[:section])

    if @section.save
      redirect_to @page, notice: 'Section was successfully created.'
    else
      render action: :new
    end
  end

  # TODO: Redirect to page if HTML request.
  def update
    if @section.update_attributes(params[:section])
      redirect_to [@page, @section], notice: 'Section was successfully updated.'
    else
      render action: :edit
    end
  end

  def destroy
    @section.destroy

    redirect_to @page, notice: 'Section was successfully destroyed.'
  end

  def sort
    @page.sections.each do |section|
      section.position = params['section'].index(section.id.to_s)
      section.save
    end
    render nothing: true
  end

  private
  def find_section
    @section = @page.sections.find(params[:id])
  end
end
