class DashboardsController < ApplicationController  
  def index
    @bookings = current_user.bookings
    if current_user.owner
      @boats = current_user.boats
    else
      "You have no boats listed!"
    end
  end
end
