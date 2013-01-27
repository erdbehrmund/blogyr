class PostsController < ApplicationController
  helper_method :current_user

  def index
    @posts = Post.paginate :page => params[:page]
    @categories = Category.all
  end

  def show
    @post = Post.find params[:id]
    @comment = Comment.new
    @comment.post = @post
  end

  def by_cat
    @category = Category.find params[:id]
    @posts = @category.posts

    @categories = Category.all
    render :index
  end

  def comment
    @comment = Comment.new
    @comment.body = Sanitize.clean(params[:comment][:body], Sanitize::Config::BASIC)
    @comment.post = Post.find params[:comment][:post_id]
    @comment.author = current_user

    if @comment.save
      redirect_to @comment.post
    else
      render :action => "show"
    end
  end
end
