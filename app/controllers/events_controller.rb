class EventsController < ApplicationController
    before_action :authenticate_user, only: [:new, :create, :edit]
  
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
    end
  

  
    def edit  
    end
  
    def update 
    end
  
    def destroy 
        
    end
end
  