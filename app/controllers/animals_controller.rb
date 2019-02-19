class AnimalsController < ApplicationController
  before_action :set_animal, except: [:index, :new, :create]

  def index
    @animals = Animal.all
  end

  def show
    @booking = @animal.bookings.find_by(user: current_user)
    # for testing purpuses
    # @booking = @animal.bookings.find_by(user: User.find(30))
    @booking ||= Booking.new
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)
    @animal.user = current_user
    if @animal.save
      redirect_to animal_path(@animal)
    else
      render :new
    end
  end

  def edit; end

  def update
    @animal.update(animal_params)
    if @animal.save
      redirect_to animal_path(@animal)
    else
      render :edit
    end
  end

  def destroy
    @animal.destroy
    redirect_to animals_path
  end

  private

  def set_animal
    @animal = Animal.find(params[:id])
  end

  def animal_params
    params.require(:animal).permit(:name, :type, :description, :price, :photo)
  end
end
