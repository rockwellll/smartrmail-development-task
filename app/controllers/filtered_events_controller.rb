class FilteredEventsController < ApplicationController
  before_action :event_params

  def index
    events = Event::between(event_params[:start_date], event_params[:end_date]);

    render json: events
  end

  private
  def event_params
    params.permit(:start_date, :end_date);
  end
end
