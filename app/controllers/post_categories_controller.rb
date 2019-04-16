class PostCategoriesController < ApplicationController
  before_action :authenticate_user!, except: :show
def index
  @post_categories = PostCategory.page params[:page]
end

  def new
    @post_category = PostCategory.new
    render :edit
  end

  def create
    @post_category = PostCategory.new post_category_params

    if @post_category.save
      redirect_to post_categories_path, notice: 'Category is Saved'
    else
      render :edit
    end
  end

  def show
    @post_category = PostCategory.find params[:id]
    @posts = @post_category.posts
    render layout:'application'
  end

  def edit
    @post_category = PostCategory.find params[:id]
  end

  def update
    @post_category = PostCategory.find params[:id]

    if @post_category.update_attributes post_category_params
      flash[:notice] = "PostCategory updated <b>successfully!</b>"
      redirect_to post_categories_path
    else
      render :edit
    end
  end

  def destroy
    @post_category = PostCategory.find params[:id]
    @post_category.destroy
    flash.now[:notice] = "PostCategory deleted <b>successfully!</b>"
    redirect_to post_categories_path
  end

  private
  def post_category_params
    params.require(:post_category).permit(:tittle, :position, :active)
  end
end
