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
    current_user = @salon.user_id
  end

  def update
     if @salon.update(salon_params)
      redirect_to @salon
    else
      redirect_to edit_salon_path
    end
  end

  def destroy
  end

  

private

def user_params
params.require(:user).permit(:first_name, :last_name, :email, :password, :role, :avatar)
end

end
