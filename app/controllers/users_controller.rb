class UsersController<ApplicationController
  before_action :authenticate_user!, :except => [:index, :new, :create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = 'Welcome! Registration successful.'
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    current_user.destroy
    redirect_to root_path
  end


private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
