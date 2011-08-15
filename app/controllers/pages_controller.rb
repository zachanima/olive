class PagesController < ApplicationController
  http_basic_authenticate_with name: 'foo', password: 'bar',
    except: [:index, :show, :home]

  # def index

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end

  def edit
    @page = Page.find(params[:id])
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
    @page = Page.find(params[:id])

    if @page.update_attributes(params[:page])
      redirect_to @page, notice: 'Page was successfully updated.'
    else
      render action: :edit
    end
  end

  def destroy
    @page = Page.find(params[:id])
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

end
