class DashboardsController < ApplicationController
  def index_vacationer
    @bookings = current_user.bookings
  end

  def index_owner
    if current_user.owner
      @boats = current_user.boats
  end
end
