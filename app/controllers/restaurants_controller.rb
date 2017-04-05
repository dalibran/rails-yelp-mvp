class RestaurantsController < ApplicationController
  before_action :find_rest, only: [:show]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def show
    @restaurant = find_rest
  end

  def create
    @restaurant = Restaurant.new(rest_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  def find_rest
    Restaurant.find(params[:id])
  end

  def rest_params
    params.require(:restaurant).permit(:name, :address, :category)
  end
end
