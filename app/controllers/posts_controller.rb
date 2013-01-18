class PostsController < ApplicationController
  def index
    @posts = Post.all
    @categories = Category.all
  end

  def show
    @post = Post.find params[:id]
  end

  def by_cat
    @category = Category.find params[:id]
    @posts = @category.posts

    @categories = Category.all

    render :index
  end
end
