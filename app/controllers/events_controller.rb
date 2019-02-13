class EventsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  
    def index
         @events=Event.all.order(start_date: :ASC)
    end
  
    def show 
    
        @event=Event.find_by(id:"#{params[:id]}")
        @date=@event.start_date
        @admin=@event.admin_id
        @present=Attendance.where(event_id: @event)
      
    end
  
    def new
        @event = Event.new
    end
  
    def subescribe
        @event=Event.find(params[:id])

        if @event.invited.include? current_user
            flash[:error]= " vous êtes déja inscrit pour cet événement"
            redirect_to @event
        end 

            @amount = @event.price 
            
            customer = Stripe::Customer.create(
                :email => params[:stripeEmail],
                :source  => params[:stripeToken]
            )
            
            charge = Stripe::Charge.create(
                :customer    => customer.id,
                :amount      => @amount,
                :description => 'Rails Stripe customer',
                :currency    => 'eur'
            )
            
            rescue Stripe::CardError => e
            flash[:error] = e.message
            redirect_to @event
            end

            @event.invited << current_user
            flash[:success]="vous êtes bien inscrit pour cet evenement" 
            redirect_to @event

    end 




    def create 
        @event = Event.new(title: params[:title],
            description: params[:description],
            start_date: params[:start_date],
            duration: params[:duration],
            price: params[:price],
            location: params[:location],
            administrator_id: current_user.id )

        if @event.save
        redirect_to root_path, :notice => "Event créé !"

        end 


        # @event = Event.new(
        #     start_date: params[:start_date], 
        #     title: params[:title],
        #     description: params[:description],
        #     price: params[:price],
        #     location: params[:location],
        #     admin_id: current_user.id)
        #     if @event.save
        #       flash[:success] = "Event créé ! "
        #       redirect_to event_path(@event.id)
        #     else
        #     end


    end

  
    def edit 
        @event = Event.find(params[:id]) 
    end
  
    def update 
        @event = Event.find(params[:id])
        if @event.update(event_params)
        flash[:success] = "Ton événement a bien été modifié !"
        redirect_to event_path(@event.id)
        else
        render :edit 
        end
    end
  
    def destroy 
        @event = Event.find(params[:id])
        if @event.destroy
        flash[:primary] = "Ton événement a bien été supprimé."
        redirect_to root_path
        return
        else
        end
        
    end


private

    def event_params
      params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location)
    end
  

  

  