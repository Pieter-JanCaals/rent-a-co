class AnimalsController < ApplicationController
  before_action :set_animal, except: [:index, :new, :create]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @animals = policy_scope(Animal)
  end

  def show
    # @booking = @animal.bookings.find_by(user: current_user)
    # for testing purpuses
    # @booking = @animal.bookings.find_by(user: User.find(30))
    @booking ||= Booking.new
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

  def animal_params
    params.require(:animal).permit(:name, :species, :description, :price, :photo)
  end
end
