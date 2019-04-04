class PagesController < ApplicationController
  def home
    @title = 'home Page'
  end

  def about
    @title = 'About Page'

  end

  def contact
    @title = 'Contact Page'

  end

  def send_contact
    render json: params
  end

  def index
    @pages = Page.all
  end

  def new
    @page = Page.new
    render :edit

  end

  def create
    @page = Page.new(page_params)

    if @page.save
      redirect_to action: :index
    else
      render :edit
    end
  end

  def edit
    @page = Page.find params[:id]
  end

  private
  def page_params
    params.require(:page).permit(:title)
  end


end
