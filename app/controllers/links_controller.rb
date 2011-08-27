class LinksController < ApplicationController
  before_filter :find_link, only: [:edit, :update, :destroy]
  http_basic_authenticate_with name: 'foo', password: 'bar'

  def new
    @link = Link.new
  end

  # def edit

  def create
    @link = Link.new(params[:link])

    if @link.save
      redirect_to root_path, notice: 'Link was successfully created.'
    else
      render action: :new
    end
  end

  def update
    if @link.update_attributes(params[:link])
      redirect_to root_path, notice: 'Link was successfully updated.'
    else
      render action: :edit
    end
  end

  def destroy
    @link.destroy

    redirect_to root_path
  end

  def sort
    Link.all.each do |link|
      link.position = params['link'].index(link.id.to_s)
      link.save
    end
    render nothing: true
  end

  private
  def find_link
    @link = Link.find(params[:id])
  end
end
