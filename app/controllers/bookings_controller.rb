class BookingsController < ApplicationController
  before_action :set_booking, only: [:update, :destroy]
  before_action :set_animal, only: [:create]

  def index
    @bookings = policy_scope(Booking).where(user: current_user)
    @pending = @bookings.where(confirmed: nil)
    @confirmed = @bookings.where(confirmed: true)
    @rejected = @bookings.where(confirmed: false)
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.start_date = Date.parse(params[:booking][:start_date])
    @booking.end_date = Date.parse(params[:booking][:end_date])
    authorize @booking
    @booking.animal = @animal
    # for testing purpuses
    # @booking.user = User.last
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path
    else
      render animal_path(@animal)
    end
  end

  def update
    authorize @booking
    if @booking.update(booking_params)
      redirect_to bookings_path
    else
      render animal_path(@animal)
    end
  end

  def destroy
    authorize @booking
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
    params.require(:booking).permit(:content)
  end
end
