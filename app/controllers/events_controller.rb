class EventsController < ApplicationController
    before_action :set_event, only: %i[ show edit update destroy ]
  
    # GET /posts or /posts.json
    def index
      @events = Event.all
    end
  
    # GET /posts/1 or /posts/1.json
    def show
    end
  
    # GET /posts/new
    def new
      @event = Event.new
    end
  
    # GET /posts/1/edit
    def edit
    end
  
    # POST /posts or /posts.json
    def create
        user = current_user
        @event = Event.new(event_params)
        if @event.save
          flash[:success] = "Event"
          redirect_to events_path
        else
          render 'new'
        end
      end

      private

      def event_params
        params.require(:event).permit(:name, :location, :event_date,
                                     :description, :start_time, :end_time)
      end
  
end