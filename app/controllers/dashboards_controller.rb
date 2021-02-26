class DashboardsController < ApplicationController  
  def index
    @bookings = current_user.bookings
  end

  def index_owner
    if current_user.owner
      @boats = current_user.boats
    else
      "You have no boats listed!"
    end
  end

  def index_incoming
  end

end
