class AdminController < ApplicationController
  def login
    if request.post?
      if params[:username]=="venkatesh"&& params[:password]=="venkatesh"
      session[:admin]="venkatesh"
      redirect_to admin_home_path
      else
      flash[:notice]="Invalid username/password"
      render :action => "login"
      end
    end
  end

  def logout
  session[:admin]=nil
  flash[:notice]="you are logged out"
  redirect_to :action => :login
  end

  def fix_history
    @fix_history=Order.all
  end
end
