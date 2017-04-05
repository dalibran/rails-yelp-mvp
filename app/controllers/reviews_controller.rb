class ReviewsController < ApplicationController
  def new
    @restaurant = find_rest
    @review = Review.new
  end

  def create
    @restaurant = find_rest
    @review = Review.new(review_params)
    @review.restaurant = find_rest
    if @review.save
      redirect_to restaurant_path(@review.restaurant_id)
    else
      render :new
    end
  end

  private

  def find_review
    Review.find(params[:id])
  end

  def find_rest
    Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end

end
