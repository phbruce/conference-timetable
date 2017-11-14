module ConferenceTimetable
  module Builder
    # lib/conference/conference_timetable/builder/driver.rb
    class Driver
      def set_defaults
        @genetic_algorithm = Finder::GeneticAlgorithm.new(@conference)
        @population = Finder::Population.new(Config.population_size, @conference)#.sort_by_fitness
      end

      def initialize(conference)
        @conference = conference
        set_defaults
      end

      def mount_schedule
        while @population.schedules.first.fitness != 1
          @population = @genetic_algorithm.envolve(@population)#.sort_by_fitness
        end

        @population.schedules.first
      end
    end
  end
end
