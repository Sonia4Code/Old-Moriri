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
  @user = User.find(params[:id])
  @salon = @user.salons
end

  def profile
    @salons = current_user.salons
    @salon = Salon.new
  end

  def edit
    render template: "users/edit"
  end

  def update
    current_user.update(user_params)
      redirect_to '/profile'
  end

  def destroy
  end

  

private

def user_params
params.require(:user).permit(:id, :first_name, :last_name, :email, :password, :role, :avatar)
end

end
