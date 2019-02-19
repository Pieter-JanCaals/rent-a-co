class BookingsController < ApplicationController
  before_action :set_animal, only: [:new, :create, :delete]

  def index
    @bookings = Booking.where("user_id = #{current_user}")
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.animal = @animal
    @booking.user = current_user
    if @booking.save
      redirect_to animal_path(@animal)
    else
      render animal_path(@animal)
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def set_animal
    @animal = Animal.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:content, :start_date, :end_date)
  end
end
