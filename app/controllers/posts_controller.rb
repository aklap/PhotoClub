class PostsController<ApplicationController
  def index

  end

  def new
  end

  def create
    @post = Post.new
  end
end
