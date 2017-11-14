module ConferenceTimetable
  module Finder
    # lib/conference/conference_timetable/population.rb
    class Population
      attr_reader :schedules

      def set_defaults
        @schedules = Array.new(
          @size,
          ConferenceTimetable::Schedule.new(@conference)
        )
      end

      def initialize(size, conference)
        @size = size
        @conference = conference

        set_defaults
      end

      def sort_by_fitness
        @schedules = @schedules.sort_by(&:fitness)
        self
      end
    end
  end
end
