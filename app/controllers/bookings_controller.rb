class BookingsController < ApplicationController
  
  before_action :check_if_logged_in
  
  def new
    
    @booking = Booking.new

  end

  def create
    @booking = Booking.new booking_params
    
    @booking.user_id = @current_user.id
    @booking.save

    if @booking.persisted?
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
    # raise 'hell'
    booking = Booking.destroy params[:id]
    redirect_to user_path(booking.user_id)
  end

  private

  def booking_params
    params.require(:booking).permit(:activity_id, :user_id, :booking_id)
  end

end
