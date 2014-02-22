class EventsController < ApplicationController
  def index
    @pagetitle = "Events Calendar"
    @pages = Page.main.visible.in_menu
    @events = Event.future.to_json(:except => [:created_at, :updated_at, :weekly])
  end

  def show
    @pages = Page.main.visible.in_menu
  end

  def json
    @pagetitle = "Events Calendar"
    @events = Event.all

    respond_to do |format|
      format.json { render :json => custom_json_for(@events) }
    end
  end

private
  def custom_json_for(value)
    list = value.map do |event|
      { :title => event.title,
        :start => event.starts,
        :end => event.ends,
        :url => "http://api.vateud.net/events/#{event.id}",
        :allDay => false
      }
    end
    list.to_json
  end

end
