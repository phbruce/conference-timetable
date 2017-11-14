require './config/initializer'

ConferenceTimetable.configure do |config|
  config.population_size = 9
  config.mutation_rate = 0.1
  config.crossover_rate = 0.3
  config.tournment_selection_size = 3
  config.number_of_elite_schedules = 1
end

schedule = ConferenceTimetable::Builder::Driver.new.mount_schedule

talk_by_track = schedule.conference.talks.group_by { |talk| talk.track.name }

x = talk_by_track.each_with_object('') do |(key, value), text|
  text << "#{key}:\n"
  value.each { |talk| text << "#{talk.title} \(#{talk.duration}\)\n" }
end

print x
