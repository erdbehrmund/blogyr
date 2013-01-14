class Admin::PostsController < AdminController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by_id params[:id]
  end

  def edit
    @post = Post.find_by_id params[:id]
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new params[:post]

    if @post.save
      redirect_to [:admin, @post], :notice => "Post was created"
    else
      render :action_new
    end
  end

  def update
    @post = Post.find params[:id]

    if @post.update_attributes params[:post]
      redirect_to [:admin, @post], :notice => "Post was updated"
    else
      render :action => "edit"
    end
  end
end