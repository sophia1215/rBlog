class Admin::PostsController < Admin::ApplicationController
  def index
    # @posts = Post.all.order(id: :desc).page(params[:page]).per(5)
    # byebug
    if params[:search].present?
      @posts = Post.where("title LIKE ? OR content LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%").page params[:page]
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
  end

  def destroy    
  end
  
end
