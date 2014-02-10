module CountriesHelper
  def airports
    if @country.airports.count > 0
      render :partial => 'airports'
    else
      render :partial => 'no_data'
    end
  end

  def upcoming_events
    if @country.subdivision.events.future.count > 0
      render :partial => 'upcoming_events'
    else
      render :partial => 'no_data'
    end
  end

  def previous_events
    if @country.subdivision.events.past.count > 0
      render :partial => 'previous_events'
    else
      render :partial => 'no_data'
    end
  end
end
