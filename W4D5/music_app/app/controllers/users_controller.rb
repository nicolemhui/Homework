class UsersController < ApplicationController
  before_action :require_login, only: [:show]

  def new
  end

  def create
    user = User.new(user_params)

    if user.save
      log_in_user!(user)
      redirect_to user_url(user)   #redirect to their specific page
    else
      flash[:errors] = user.errors.full_messages
      redirect_to new_user_url
    end
  end

  def index
    @users = User.all
    render :index
  end

  def show
    user = User.find(params[:id])
    render :show
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

  def require_login
    redirect_to new_user_url unless current_user
  end
end
