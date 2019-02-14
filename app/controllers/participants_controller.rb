class InvitedsController < ApplicationController
  def index 
    @participants = Attendance.where(event_id: params[:event_id])
    puts @participants
    @event = Event.find(params[:event_id])
  end
  
  def new
    @event = Event.new
  
    @amount = Event.find(params[:event_id]).price
  end
  
  def create
    @amount = (Event.find(params[:event_id]).price) * 100
    
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )
  
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    @attendee = Attendance.new(
      stripe_customer_id: customer.id, 
      event_id: params[:event_id], 
      guest_id: current_user.id)

 
    if charge.save
      if @attendee.save
      flash[:success] = "Vous avez bien été débité de #{@amount / 100}€, et êtes bien inscrit à l'événement !"
      redirect_to event_path(params[:event_id])
      return 
      else 
        flash[:error] = "Une erreur s'est produite"
        redirect_to new_event_participation_path
      end
    else
    end
  
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_participation_path
  end
end
