class EventsController < ApplicationController
  skip_before_action :verify_authenticity_token

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
    @this_week = Date.current

    unless (request.query_parameters["start_date"].nil?)
      @this_week = request.query_parameters["start_date"].to_datetime
    end
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to events_path, notice: 'Event was successfully created.' }
        format.json { render :index, status: :created, location: @event}
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:name, :begins_at, :ends_at, :description, :location,:users)
  end
end
