class ProductsController < ApplicationController
  before_action :check_if_logged_in, except: [ :index, :show ]
  
  def new

    @product = Product.new 
  end

  def create

    @product = Product.new product_params
    @product.user_id = @current_user.id
    if params[:product][:image].present?
      response = Cloudinary::Uploader.upload params[:product][:image]
      # p response
      @product.image = response["public_id"]
    end
    @product.save

    if @product.persisted?
      redirect_to products_path
    else
      render :new
    end #else
  end

  def index
    @products = Product.all
  end

  def show
    @product = Product.find params[:id]
    @comment = Comment.new
    @buy = Buy.new
  end

  def edit
    @product = Product.find params[:id]
    
    if @product.user_id != @current_user.id
      redirect_to login_path # don't even show the edit form  
    end

  end

  def update
    @product = Product.find params[:id]

    # check again that this mixtape belongs to the logged-in user, since people can still work out the edit URL
    if @product.user_id != @current_user.id
      redirect_to login_path
      return
      #stop the rest of the code from running
      #i.e prevent .ipdate that follows
      # note: a redirect_to does not on its own prevernt the rest of the controller action's code from running
    end
    
    if @product.update product_params
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def destroy

    if @product.user_id != @current_user.id
      redirect_to login_path
      return
    end

    Product.destroy params[:id]

    redirect_to products_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price, :sold, :user_id)
  end
end
