class ReviewsController < ApplicationController
  # before_action :find_restaurant

  def new; end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    @review.save
    redirect_to restaurant_path(@restaurant)
    # else
    #   render :new
    # end
  end

  private

  def find_restaurant
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
