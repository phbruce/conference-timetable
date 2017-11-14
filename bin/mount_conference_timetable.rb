require './config/initializer'

ConferenceTimetable.configure do |config|
  config.population_size = 9
  config.mutation_rate = 0.1
  config.crossover_rate = 0.3
  config.tournment_selection_size = 3
  config.number_of_elite_schedules = 1
end

print Translator::Loader.new.load!
