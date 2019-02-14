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
    @user_id = current_user.id
    end
  
    def create 
            @event = Event.new(title: params[:title],
                description: params[:description],
                start_date: params[:start_date],
                duration: params[:duration],
                price: params[:price],
                location: params[:location],
                admin_id: current_user.id )

    if @event.save 
    redirect_to root_path, :notice => "Evénement créé !"
    else
    render 'new'
    end
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

end 
  

  

  