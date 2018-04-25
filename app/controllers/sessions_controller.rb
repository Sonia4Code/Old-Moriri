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
    redirect_to '/'
  end

  def create_from_omniauth
  auth_hash = request.env["omniauth.auth"]
  authentication = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) ||  Authentication.create_with_omniauth(auth_hash)

      # if: previously already logged in with OAuth
      if authentication.user
        user = authentication.user
        user.avatar = request.env["omniauth.auth"]["info"]["image"]
        user.save!
        authentication.update_token(auth_hash)
        @next = root_url
        flash[:success] = "Signed in!"     
        # @notice = "Signed in!"
      # else: user logs in with OAuth for the first time
      else
        user = User.create_with_auth_and_hash(authentication, auth_hash)
        # you are expected to have a path that leads to a page for editing user details
        @next = root_url
        flash[:success] = "Congratulations! You have successfully created a Moriri ccount"     
        # @notice = "User created."
      end

      session[:user_id] = user.id
      redirect_to @next, :notice => @notice
    end
    
private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :role, :avatar)
   end

end

