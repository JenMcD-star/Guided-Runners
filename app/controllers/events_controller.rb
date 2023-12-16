class EventsController < ApplicationController
    def index
      @events = Event.all
    end
  
    def show
      @event = Event.find(params[:id])
    end
  
    def new
      @event = Event.new
    end
  
    def edit
      @event = Event.find(params[:id])
    end
  
    def update
      @event = Event.find(params[:id])
      if @event.update(event_params)
        flash[:success] = "Event updated"
        redirect_to @event
      else
        render 'edit'
      end
    end
  
    def create
        @user = current_user
        @event = Event.new(event_params)
        if @event.save
          flash[:success] = "Event Added!"
          redirect_to events_path
        else
          flash.now[:danger] = 'please log in'
          render 'new'
        end
      end

      def destroy
        @event = current_user.events.find(params[:id])
        @event.destroy
      
      flash[:success] = "event destroyed."
      redirect_to events_path
      end


      private

      

      def event_params
        params.require(:event).permit(:name, :location, :event_date,
                                     :description, :start_time, :end_time, :user_id).merge(user: current_user)

      end
  end
  
