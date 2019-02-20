class BookingsController < ApplicationController
  before_action :set_booking, only: [:update, :destroy]
  before_action :set_animal, only: [:create]

  def index
    @bookings = Booking.where(user: current_user)
    @pending = @bookings.where(confirmed: nil)
    @confirmed = @bookings.where(confirmed: true)
    @rejected = @bookings.where(confirmed: false)
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.animal = @animal
    # for testing purpuses
    # @booking.user = User.last
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path
    else
      render "animals/show"
    end
  end

  def update
    if @booking.update(booking_params)
      redirect_to bookings_path
    else
      render "animals/show"
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def set_animal
    @animal = Animal.find(params[:animal_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:content, :start_date, :end_date)
  end
end
