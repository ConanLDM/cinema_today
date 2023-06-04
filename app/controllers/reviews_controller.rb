class ReviewsController < ApplicationController
  # to find the film associated with the review, the following controller code is implemented
  before_action :set_film, only: %i[new create]


  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.film = @film
    if @review.save
      redirect_to film_path(@film)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to film_path(@review.film), status: :see_other
  end

  private

  def set_film
    @film = Film.find(params[:film_id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
