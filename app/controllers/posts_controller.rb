class PostsController<ApplicationController
  def index
    @posts = Post.all
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

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end
end
