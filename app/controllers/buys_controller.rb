class BuysController < ApplicationController
  def new
    @buy = Buy.new
  end

  def create
    @buy = Buy.new buy_params
    # @booking.activity_id = params[:activity_id]
    if @current_user.present?
      @buy.user_id = @current_user.id
      @buy.save
    else
      redirect_to login_path
    end

    if @buy.persisted?
      redirect_to user_path(@current_user.id)
    else
      render :new
    end #else
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    buy = Buy.destroy params[:id]
    redirect_to user_path(buy.user_id)
  end

  private

  def buy_params
    params.require(:buy).permit(:product_id, :user_id, :buy_id)
  end

end
