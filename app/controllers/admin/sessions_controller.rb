class Admin::SessionsController < Admin::ApplicationController
  before_action :authorize, except: [:new, :create]

  def new
    redirect_to admin_dashboard_index_url if current_moderator
  end

  def create
    @moderator = Moderator.find_by(username: params[:username]).try(:authenticate,params[:password])
    if @moderator
      session[:current_moderator_id] = @moderator.id
      redirect_to admin_moderators_url, notice: 'You have successfully signed in.'
    else
      flash[:alert] = "There was a problem with your username or password."
      # render :new
      redirect_to '/login'
    end
    # byebug
  end

  def destroy
    session[:current_moderator_id] = nil
    redirect_to '/login', notice: 'You have successfuly logged out.'
  end
end
