module ConferenceTimetable
  # conference_timetable/config.rb
  module Config
    extend self

    attr_accessor :population_size
    attr_accessor :mutation_rate
    attr_accessor :crossover_rate
    attr_accessor :tournment_selection_size
    attr_accessor :number_of_elite_schedules
  end
end
