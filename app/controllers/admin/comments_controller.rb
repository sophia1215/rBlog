class Admin::CommentsController < Admin::ApplicationController
  def index
    @comments = Comment.where(status: to_bool(params[:status]))
  end

  def update
  end

  def destroy
    @coment = Comment.find(params[:id])
    @coment.destroy

    redirect_to :back, notice: 'Successfully deleted comment'
  end
end
