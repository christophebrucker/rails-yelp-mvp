class ReviewsController < ApplicationController
  before_action :set_restaurant, except: [:destroy]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant

    if @review.save # true or false
      # render :new
      redirect_to restaurant_path(@restaurant)
    else
      render :new # rendering the form with error message
    end
  end

  def destroy
    review = Review.find(params[:id])
    restaurant = review.restaurant
    review.destroy

    redirect_to restaurant_path(restaurant)
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
