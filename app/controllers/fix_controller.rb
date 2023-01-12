class FixController < ApplicationController
  before_action :authenticate_user!
  def index
    @fix = Fix.new
    @fix_i= Room.find(params[:room_id])
    
  end

  def new
    @fix = Fix.new
  end

  def create
    @fix =Fix.new(fix_params)
    
    if @fix.save
      
      redirect_to home_checkout_url(:id =>@fix.id)
    else
      
      @fix.errors.messages.first
      flash[:error] = @fix.errors.messages.first[1][0]
      redirect_to "/fix/index?room_id=#{params[:fix][:room_id]}"
    end
  end
  private
  def fix_params
   
     
    params.require(:fix).permit(:check_in,:check_out,:room_id,:user_id)
  end
end
