class BookingController < ApplicationController
  def index
    @booking = Order.find_by_sql ["Select * from orders WHERE user_id like ?", current_user.id]
  end
end
