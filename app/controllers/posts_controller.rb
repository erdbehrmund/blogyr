class PostsController < ApplicationController
  def index
    @posts = Post.all
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
    @comment = Comment.new params[:comment]
    @comment.author = current_user
    if @comment.save
      redirect_to @comment.post
    else
      render :action => "show"
    end
  end
end
