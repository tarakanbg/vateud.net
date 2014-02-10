class Station

  include ActiveModel::Validations
  include ActiveModel::Serialization
  include ActiveModel::Naming
  include ActiveModel::Callbacks


  @attributes = %w{callsign name role frequency altitude groundspeed aircraft
      origin destination rating facility remarks route atis logon latitude longitude
      planned_altitude transponder heading qnh_in qnh_mb flight_type cid gcmap
      latitude_humanized longitude_humanized online_since gcmap_width gcmap_height
      atis_message}
  @attributes.each {|attribute| attr_accessor attribute.to_sym }

  def initialize(station, args = nil)
    @role = station.role unless station.role.nil?
    @callsign = station.callsign unless station.callsign.nil?
    @frequency = station.frequency unless station.frequency.nil?
    @cid = station.cid unless station.cid.nil?
    @name = station.name unless station.name.nil?
    @rating = station.rating unless station.rating.nil?
    @aircraft = station.aircraft unless station.aircraft.nil?
    @flight_type = station.flight_type unless station.flight_type.nil?
    @origin = station.origin unless station.origin.nil?
    @route = station.route unless station.route.nil?
    @destination = station.destination unless station.destination.nil?
    @altitude = station.altitude if station.altitude.to_i > 0 unless station.altitude.nil?
    @groundspeed = station.groundspeed unless station.groundspeed.nil?
    @heading = station.heading unless station.heading.nil?
    @facility = station.facility unless station.facility.nil?
    @remarks = station.remarks unless station.remarks.nil?
    @planned_altitude = station.planned_altitude unless station.planned_altitude.nil?
    @transponder = station.transponder unless station.transponder.nil?
    @qnh_in = station.qnh_in unless station.qnh_in.nil?
    @qnh_mb = station.qnh_mb unless station.qnh_mb.nil?
    @gcmap = station.gcmap unless station.gcmap.nil?
    @latitude = station.latitude unless station.latitude.nil?
    @longitude = station.longitude unless station.longitude.nil?
    @latitude_humanized = station.latitude_humanized unless station.latitude_humanized.nil?
    @longitude_humanized  = station.longitude_humanized unless station.longitude_humanized.nil?
    @logon = station.logon unless station.logon.nil?
    @online_since = station.online_since unless station.online_since.nil?
    @gcmap_width = station.gcmap_width unless station.gcmap_width.nil?
    @gcmap_height = station.gcmap_height unless station.gcmap_height.nil?
    @atis = station.atis unless station.atis.nil?
    @atis_message = station.atis_message unless station.atis_message.nil?
  end



end
