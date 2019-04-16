class PostsController < ApplicationController
  before_action :authenticate_user!, except: :show
  
  def index
    @post = Post.page params[:page]
  end

  def new
    @post = Post.new
    render :edit
  end

  def create
    @post = Post.new post_params

    if @post.save
      redirect_to posts_path, notice: 'Post Saved'
    else
      render :edit
    end
  end

  def show
    @post = Post.find params[:id]
    render layout:'application'
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]

    if @post.update_attributes post_params
      flash[:notice] = "Post updated <b>successfully!</b>"
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find params[:id]
    @post.destroy
    flash.now[:notice] = "Post deleted <b>successfully!</b>"
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :post_category_id, :image)
  end
end
