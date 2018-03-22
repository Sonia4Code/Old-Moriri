class UsersController < ApplicationController
  # skip_before_action :require_valid_user!
  # before_action :reset_session

  def new
    @user = User.new
    # render template: "users/new"
  end

  def create
    @user = User.new(user_params)
    # @user.password = user_params[:password]
    if @user.save!
      session[:user_id] = @user.id
      flash[:success] = "You have successfully created an account"
      redirect_to root_url
    else
    redirect_to '/signup'      
    end
  end

  



  # def login
  #   @user = User.find_by_email(user_params[:email])
  #   if @user.password == user_params[:password]
  #     give_token
  #   else
  #     redirect_to root_url
  #   end
  # end

private

def user_params
params.require(:user).permit(:first_name, :last_name, :email, :password)
end

end
