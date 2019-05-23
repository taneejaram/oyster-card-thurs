class Journey
  attr_reader :entry_station, :exit_station, :journeys

  def initialize
    @journeys = []
  end

  def start(entry_station)
    @entry_station = entry_station
  end

  def stop(exit_station)
    @exit_station = exit_station
  end

  def complete?
    if @entry_station != nil && @exit_station != nil
      true
    end
  end

  def store_journey
    @journeys.push({:entry_station => entry_station, :exit_station => exit_station})
  end

end
