class PagesController < ApplicationController
  def home
    @title = 'home Page'
  end

    render json: params

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
      flash[:notice] = "Page created <b>successfully!</b>"
      redirect_to pages_path
    else
      render :edit
    end
  end

  def show
    @page = Page.find params[:id]
  end

  def edit
    @page = Page.find params[:id]
  end

  def update
    @page = Page.find params[:id]

    if @page.update_attributes page_params
      flash[:notice] = "Page updated <b>successfully!</b>"
      redirect_to pages_path
    else
      render :edit
    end
  end

  def destroy
    @page = Page.find params[:id]
     @page.destroy
    flash.now[:notice] = "Page deleted <b>successfully!</b>"
    redirect_to pages_path
  end

  private
  def page_params
    params.require(:page).permit(:title, :position, :menu, :draft, :home_page, :content, :meta_title, :meta_keyword, :meta_description)
  end


end
