module ConferenceTimetable
  module Finder
    # conference/conference_timetable/genetic_algoritm.rb
    class GeneticAlgorithm
      def initialize(conference)
        @conference = conference
      end

      def envolve(population)
        mutate_population(crossover_population(population))
      end

      def crossover_population(population)
        crossover_population = Population.new(population.schedules.size, @conference)

        0.upto(Config.number_of_elite_schedules) do |i|
          crossover_population.schedules[i] = population.schedules[i]
        end

        Config.number_of_elite_schedules.upto(population.schedules.size - 1) do |i|
          if Config.crossover_rate > rand
            sched1 = select_tournment_population(population).schedules[0]#.sort_by_fitness.schedules[0]
            sched2 = select_tournment_population(population).schedules[0]#.sort_by_fitness.schedules[0]
            crossover_population.schedules[i] = crossover_schedule(sched1, sched2)
          else
            crossover_population.schedules[i] = population.schedules[i]
          end
        end

        crossover_population
      end

      def crossover_schedule(schedule1, schedule2)
        crossover_schedule = ::ConferenceTimetable::Schedule.new(@conference)

        0.upto(crossover_schedule.talks.size - 1) do |i|
          if rand > 0.5
            crossover_schedule.talks[i] = schedule1.talks.at(i)
          else
            crossover_schedule.talks[i] = schedule2.talks.at(i)
          end
        end

        crossover_schedule
      end

      def mutate_population(population)
        mutate_population = Population.new(population.schedules.size, @conference)
        schedules = mutate_population.schedules

        0.upto(Config.number_of_elite_schedules) do |i|
          schedules[i] = population.schedules.at(i)
        end

        Config.number_of_elite_schedules.upto(population.schedules.size - 1) do |i|
          schedules[i] = mutate_schedule(population.schedules.at(i))
        end

        mutate_population
      end

      def mutate_schedule(mutate_schedule)
        schedule = ::ConferenceTimetable::Schedule.new(@conference)

        0.upto(mutate_schedule.talks.size - 1) do |i|
          if Config.mutation_rate > rand
            mutate_schedule.talks[i] = schedule.talks.at(i)
          end
        end

        mutate_schedule
      end

      def select_tournment_population(population)
        tournment_population = Population.new(Config.tournment_selection_size, @conference)

        0.upto(Config.tournment_selection_size) do |i|
          rand_index = ((population.schedules.size - 1) * rand).round
          tournment_population.schedules[i] = population.schedules.at(rand_index)
        end

        tournment_population
      end
    end
  end
end
