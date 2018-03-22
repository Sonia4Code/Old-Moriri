class SessionsController < ApplicationController


  def new
  end

  def create
    reset_session
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = "Welcome Back"      
      redirect_to root_url
    else 
      flash[:error] = "Invalid email/password combination" 
    end
  end

  
  def destroy
    reset_session    
    redirect_to '/login'
  end

    
  private

  # def session_params
  #   params.require(:session).permit(:email, :password)
  # end

end
