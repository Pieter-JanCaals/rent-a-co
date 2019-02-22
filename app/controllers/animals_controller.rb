class AnimalsController < ApplicationController
  before_action :set_animal, except: [:index, :new, :create]
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_booking, only: [:show]

  def index
    if params[:search_query].present?
      @animals = policy_scope(Animal).search_by_name_and_species_and_description_and_price(params[:search_query])
    elsif params[:query].present? && current_user.id == params[:query].to_i
      @animals = policy_scope(Animal).where(user_id: params[:query].to_i)
    else
      @animals = policy_scope(Animal)
    end
  end

  def show
    if @animal.user == current_user
      @bookings = @animal.bookings.where(confirmed: nil)
    end
    @booking = Booking.new unless @booking.confirmed.nil?
    authorize @animal
  end

  def new
    @animal = Animal.new
    authorize @animal
  end

  def create
    @animal = Animal.new(animal_params)
    authorize @animal
    @animal.user = current_user
    if @animal.save
      redirect_to animal_path(@animal)
    else
      render :new
    end
  end

  def edit
    authorize @animal
  end

  def update
    authorize @animal
    @animal.update(animal_params)
    if @animal.save
      redirect_to animal_path(@animal)
    else
      render :edit
    end
  end

  def destroy
    authorize @animal
    @animal.destroy
    redirect_to animals_path
  end

  private

  def set_animal
    @animal = Animal.find(params[:id])
  end

  def set_booking
    @booking = @animal.bookings.where(confirmed: nil).find_by(user: current_user)
    @booking ||= Booking.new
  end

  def animal_params
    params.require(:animal).permit(:name, :species, :description, :price, :photo, :search_by_name_and_species_and_description_and_price)
  end
end
