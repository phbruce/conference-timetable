module ConferenceTimetable
  # conference_timetable/talk.rb
  class Talk
    attr_accessor :track
    attr_reader :title, :duration

    def initialize(title, duration)
      @title = title
      @duration = duration
    end
  end
end
