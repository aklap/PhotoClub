class PostsController<ApplicationController
  def index
    @posts = Post.all
    if current_user == nil
      flash[:notice] = "You need to sign in or sign up before continuing."
    end
  end

  def new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Upload succesful! Here's your upload:"
      redirect_to @post
    else
      flash[:alert] = "Oops, I can't see anything. You need an image to post!"
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(post_params)
    if @post.save
      flash[:notice] = 'Update successful!'
      redirect_to @post
    else
      flash[:alert] = 'Something went wrong.'
      render :edit
    end
  end

  def destroy
   @post = Post.find(params[:id])
   if @post.destroy
     flash[:notice] = 'Post destroyed!'
     redirect_to '/'
   else
     flash[:alert] = 'Post missing or could not be deleted.'
     render :edit
   end
  end

 private
  def post_params
    params.require(:post).permit(:caption, :image)
  end
end
