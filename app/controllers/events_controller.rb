class EventsController < ApplicationController
  include EventsHelper

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      flash[:notice] = 'Event successfully created!'
      redirect_to @event
    else
      flash[:alert] = 'Some error!'
      render 'new'
    end
  end
end
