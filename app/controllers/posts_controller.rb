class PostsController<ApplicationController
  def index
  end

  def new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end
end
