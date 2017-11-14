module ConferenceTimetable
  module Finder
    # conference/conference_timetable/driver.rb
    class Driver
      include Config

      def set_defaults
        @schedule_number = 0
        @genetic_algorithm = GeneticAlgorithm.new(@conference)
        @population = Population.new(Config.population_size, @conference)#.sort_by_fitness
      end

      def initialize
        @conference = ConferenceTimetable::Conference.new
        set_defaults
      end

      def mount_schedule
        while @population.schedules[0].fitness != 1
          @population = @genetic_algorithm.envolve(@population)#.sort_by_fitness
          @schedule_number = 0
        end

        { schedule: @population.schedules[0] }
      end
    end
  end
end
