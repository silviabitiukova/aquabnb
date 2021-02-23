class BoatsController < ApplicationController
  before_action :set_boat, only: [:show, :destroy, :edit, :update]

  def index
    @boats = Boat.all
  end

  def show
  end

  def new
    @boat = Boat.new
  end

  def create
    @boat = Boat.new(boat_params)
    @boat.user = current_user
    @boat.user.owner = true
    if @boat.save
      redirect_to boat_path(@boat)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @boat.update(boat_params)
      redirect_to boat_path(@boat)
    else
      render :edit
    end
  end

  def destroy
    @boat.destroy
    redirect_to root_path
  end

  private

  def set_boat
    @boat = Boat.find(params[:id])
  end

  def boat_params
    params.require(:boat).permit(:price_per_day, :name, :length, :description, :port_location, :type, :year, :passenger_capacity)
  end
end
