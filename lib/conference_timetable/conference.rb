module ConferenceTimetable
  # lib/conference_timetable/conference.rb
  class Conference
    attr_accessor :tracks, :talks, :number_of_tracks

    def set_defaults
      @tracks = [Track.new('Track 01', 420), Track.new('Track 02', 420)]

      @talks = [
        Talk.new('Writing Fast Tests Against Enterprise Rails', 60),
        Talk.new('Overdoing it in Python', 45),
        Talk.new('Lua for the Masses', 30),
        Talk.new('Ruby Errors from Mismatched Gem Versions', 45),
        Talk.new('Common Ruby Errors', 45),
        Talk.new('Rails for Python Developers lightning', 5),
        Talk.new('Communicating Over Distance', 60),
        Talk.new('Accounting-Driven Development', 45),
        Talk.new('Woah', 45),
        Talk.new('Sit Down and Write', 30),
        Talk.new('Pair Programming vs Noise', 45),
        Talk.new('Rails Magic', 60),
        Talk.new('Ruby on Rails: Why We Should Move On', 60),
        Talk.new('Clojure Ate Scala (on my project)', 45),
        Talk.new('Programming in the Boondocks of Seattle', 30),
        Talk.new('Ruby vs. Clojure for Back-End Development', 30),
        Talk.new('Ruby on Rails Legacy App Maintenance', 60),
        Talk.new('A World Without HackerNews', 30),
        Talk.new('User Interface CSS in Rails Apps', 30)
      ].shuffle

      @number_of_tracks = @talks.size
    end

    def initialize
      set_defaults
    end
  end
end
