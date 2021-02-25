class BookingsController < ApplicationController
  def new
    @boat = Boat.find(params[:boat_id])
    @booking = Booking.new
    @booking.start_date = params[:query][:start_date].to_date if params[:query].present?
    @booking.end_date = params[:query][:end_date].to_date if params[:query].present?
    @booking.number_of_guests = params[:query][:number_of_guests] if params[:query].present?


  end

  def create
    @booking = Booking.new(boat_params)
    @boat = Boat.find(params[:boat_id])
    @booking.boat = @boat
    @booking.user = current_user
    # raise
    if @booking.save
      redirect_to root_path
    else
      render :new
    end



  end

  private

  def boat_params
    my_params = params.require(:booking).permit(:number_of_guests, "start_date(1i)", "start_date(2i)", "start_date(3i)", "end_date(1i)", "end_date(2i)", "end_date(3i)")
    start_date = Date.new(my_params["start_date(1i)"].to_i, my_params["start_date(2i)"].to_i, my_params["start_date(3i)"].to_i)
    end_date = Date.new(my_params["end_date(1i)"].to_i, my_params["end_date(2i)"].to_i, my_params["end_date(3i)"].to_i)
    args = { number_of_guests: my_params[:number_of_guests], start_date: start_date, end_date: end_date }
  end


end
