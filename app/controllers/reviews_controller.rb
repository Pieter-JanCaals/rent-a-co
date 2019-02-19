class ReviewsController < ApplicationController
  def create
    @animal = Animal.find(params[:animal_id])
    @review = Review.new(review_params)
    @review.animal = @animal
    if @review.save
      redirect_to animal_path(@animal)
    else
      render "animals/#{params[:animal_id]}"
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
