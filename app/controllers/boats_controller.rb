class BoatsController < ApplicationController
  before_action :set_boat, only: [:show, :destroy, :edit, :update]

  def index
    if params[:query].present? && params[:query][:port_location].present?
      @boats = Boat.search_by_port_location(params[:query][:port_location])
      # raise
    else
      @boats = Boat.all
    end

  #   #map @ boats to include only those boats where bookings do not include sd OR ed
  #   if (params[:query][:start_date] && params[:query][:end_date]).present?
  #     sd = params[:query][:start_date].to_date
  #     ed = params[:query][:end_date].to_date
  #     @boats_available = []
  #     @boats.each do |boat|
  #       boat_avail = true
  #       boat.bookings.each do |booking|
  #         booking_sd = booking[:start_date]
  #         booking_ed = booking[:end_date]
  #         boat_avail = false if (booking_sd || booking_ed).between?(sd,ed)
  #       end
  #       @boats_available.push(boat) if boat_avail
  #     end
  #   end
  #   @boats_available
  end

  def show

  end

  def new
    @boat = Boat.new
  end

  def create
    @boat = Boat.new(boat_params)
    @boat.year = params[:boat]["year(1i)"]
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
      redirect_to boats_path
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
    params.require(:boat).permit(:price_per_day, :name, :length, :description, :port_location, :boat_type, :year, :passenger_capacity, :photo)
  end
end
