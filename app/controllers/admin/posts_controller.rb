class Admin::PostsController < Admin::ApplicationController
  def index
    # @posts = Post.all.order(id: :desc).page(params[:page]).per(5)
    # byebug
    if params[:search].present?
      @posts = Post.mattching_title_or_content(params[:search]).page params[:page]
    else
      @posts = Post.all.order(id: :desc).page params[:page]
    end
  end

  def new
  end

  def create    
  end

  def edit
  end

  def update    
  end

  def show
    # byebug
    @post = Post.find(params[:id])
  end

  def destroy    
  end
  
end
