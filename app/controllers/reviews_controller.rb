class ReviewsController < ApplicationController
  def create
    @booking = Booking.new
    @animal = Animal.find(params[:animal_id])
    @reviews = @animal.reviews
    @review = Review.new(review_params)
    @review.animal = @animal
    @review.user = current_user
    authorize @review
    if @review.save
      redirect_to animal_path(@animal)
    else
      render "animals/show"
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
