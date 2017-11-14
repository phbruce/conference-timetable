module ConferenceTimetable
  # lib/conference_timetable/track.rb
  class Track
    attr_reader :name, :max_time

    def initialize(name, max_time)
      @name = name
      @max_time = max_time
    end
  end
end
