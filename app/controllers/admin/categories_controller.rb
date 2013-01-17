class Admin::CategoriesController < AdminController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find params[:id]
  end

  def create
    @category = Category.new params[:category]

    if @category.save
      redirect_to admin_categories_path
    else
      render :action => 'new'
    end
  end

  def update
    @category = Category.find params[:id]

    if @category.update_attributes params[:category]
      redirect_to admin_categories_path
    else
      render :action => 'edit'
    end

  end
end
