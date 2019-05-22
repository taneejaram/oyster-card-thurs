class Journey
  attr_reader :entry_station, :exit_station

  def start(entry_station)
    @entry_station = entry_station
  end

  def stop(exit_station)
    @exit_station = exit_station
  end

end