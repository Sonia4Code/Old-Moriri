class UsersController < ApplicationController

  def index
  end
  
  def new
    @user = User.new
  end

  def create
    p params
    @user = User.new(user_params)
    if @user.save!
      session[:user_id] = @user.id
      flash[:notice] = "You have successfully created an account"
      redirect_to root_url
    else
    redirect_to '/signup'      
    end
  end

  def show

  end

  def edit
    @user = current_user
  end

  def update
     if @user.update(user_params)
      redirect_to @user
    else
      redirect_to edit_user_path
    end
  end

  def destroy
  end

  

private

def user_params
params.require(:user).permit(:first_name, :last_name, :email, :password, :role, :avatar)
end

end
