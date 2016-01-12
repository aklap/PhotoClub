class SessionsController<ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:notice] = "Login successful!"
      redirect_to posts_path
    else
      flash[:notice] = "Username or password is invalid"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:alert] = "Signed out successfully!"
    redirect_to root_path
  end
end
