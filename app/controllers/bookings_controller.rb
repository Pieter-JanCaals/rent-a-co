class BookingsController < ApplicationController
  before_action :set_booking, only: [:update, :destroy, :confirm_booking]
  before_action :set_animal, only: [:create]

  def index
    @bookings = policy_scope(Booking).where(user: current_user)
    @pending = @bookings.pending
    @confirmed = @bookings.confirmed
    @rejected = @bookings.rejected
    @owner_pending = find_owner_pending
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.animal = @animal
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

  def confirm_booking
    authorize @booking
    @booking.confirmed = booking_params_confirm["confirmed"] == "true"
    @booking.save
    redirect_to bookings_path
  end

  private

  def find_owner_pending
    Booking.where(confirmed: nil).select do |booking|
      booking.animal.user == current_user
    end
  end

  def set_animal
    @animal = Animal.find(params[:animal_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:content, :start_date, :end_date)
  end

  def booking_params_confirm
    params.permit(:confirmed)
  end
end
