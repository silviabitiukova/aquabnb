class DashboardsController < ApplicationController  
  def index
    @bookings = current_user.bookings
  end

  def index_owner
      @boats = current_user.boats
  end

  def index_incoming
  end

end
