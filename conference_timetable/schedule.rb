module ConferenceTimetable
  # conference_timetable/schedule.rb
  class Schedule
    attr_reader :conference, :number_of_conflicts

    def set_defaults
      @class_number = 0
      @is_fitness_changed = true
      @number_of_conflicts = 0
      @fitness = -1

      @talks = @conference.talks.each { |talk| talk.track = random_track }
    end

    def initialize(conference)
      @conference = conference

      set_defaults
    end

    def talks
      @is_fitness_changed = true
      @talks
    end

    def fitness
      if @is_fitness_changed
        @fitness = calculate_fitness
        @is_fitness_changed = false
      end

      @fitness
    end

    def calculate_fitness
      @number_of_conflicts = 0

      talks_by_tracks.each_value do |val|
        track_max_time = val.first.track.max_time
        talks_total_duration = val.map(&:duration).inject(:+)
        @number_of_conflicts += 1 if talks_total_duration > track_max_time
        @number_of_conflicts += 1 if talks_total_duration < 360
      end

      1 / (@number_of_conflicts + 1)
    end

    private

    def talks_by_tracks
      @conference.talks.group_by { |talk| talk.track.name }
    end

    def random_track
      @conference.tracks[((@conference.tracks.size - 1) * rand).round]
    end
  end
end
