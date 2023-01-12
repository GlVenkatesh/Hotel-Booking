class HomeController < ApplicationController
  def index
    @cities = City.all
  end

  def select
    @room= Hotel.find(params[:hotel_id])
  end

  def full_view
    puts "view method called with params: #{params}"
    Rails.logger.info "yoo"
    @hotels= City.find(params[:city_id])
  end

  def checkout
   
    @fix= Fix.find(params[:id])
    @days= (@fix.check_out.to_date  - @fix.check_in.to_date ).to_i
    amount_to_charge = session[:amount].to_i * @days
    p amount_to_charge
    @id=params[:id]
	if request.post?
    p"---------------------Start-------------------"
	
		ActiveMerchant::Billing::Base.mode = :test
		
		credit_card = ActiveMerchant::Billing::CreditCard.new(
		:first_name         => params[:first_name],
		:last_name          => params[:last_name],
		:number             => params[:credit_card_no].to_i,
		:month              => params[:check][:month].to_i,
		:year               => params[:check][:year].to_i,
		:verification_value => params[:verification_number].to_i)
   
		gateway =ActiveMerchant::Billing::TrustCommerceGateway.new(
		:login => 'TestMerchant',
		:password =>'password',
		:test => 'true' )
   
		response = gateway.authorize(amount_to_charge , credit_card)

		puts response.inspect
		if response.success?
   
			gateway.capture(amount_to_charge, response.authorization)
     
			fix=Fix.find(params[:id])
        p fix
        order=Hash.new
        
        order[:fix_id]=fix.id
        order[:user_id]=fix.user_id
        order[:room_id]=fix.room_id
        order[:total_price]=amount_to_charge
       
        p "------------1st----------"
        p order
        orderdetails=Order.new(order)
        orderdetails.save

        purchase_completed=orderdetails.id
        p "------------1st--------------------------------------------------"
        p purchase_completed
      
        
			redirect_to purchase_completed_path(:id => purchase_completed)
		else
			flash[:notice]= "Something went wrong.Try again"
			render :action => "checkout"
		end	
	end
  end
  def search
    keyword = '%' + params[:keyword] + '%'
    @search = City.find_by_sql ["Select * from cities WHERE name like ? ",keyword]
  end
 def purchase_completed
  @fix=Order.find(params[:id])  
 end
end
