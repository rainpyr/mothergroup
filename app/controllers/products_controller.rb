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
      redirect_to product_path(@product.id)
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
    # raise 'hell'
    @product = Product.find params[:id]
    @product.user_id = @current_user.id

    if params[:product][:image].present?
      response = Cloudinary::Uploader.upload params[:product][:image]
      # p response
      @product.image = response["public_id"]
    end
    @product.save
    
    
    # connect the selectd kinds to product using the many-to-many association
    
    @product.kinds.delete_all
    
    if params[:kind_ids].present?
      @product.kinds << Kind.find(params[:kind_ids])
    end
    
    if @product.update product_params
      redirect_to product_path(@product)
    else
      render :edit
    end
    if @product.user_id != @current_user.id
      redirect_to login_path
      return
     
    end
  end

  def destroy

    @product = Product.find params[:id]

    if @product.user_id != @current_user.id
      redirect_to login_path
      return
    end

    @product.destroy
    redirect_to products_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price, :sold, :user_id)
  end
end
