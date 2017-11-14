module ConferenceTimetable
  # lib/conference_timetable/conference.rb
  class Conference
    attr_accessor :tracks, :talks

    def initialize(tracks, talks)
      @tracks = tracks
      @talks = talks
    end
  end
end
