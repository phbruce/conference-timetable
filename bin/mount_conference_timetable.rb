require './config/initializer'

ConferenceTimetable.configure do |config|
  config.population_size = 9
  config.mutation_rate = 0.1
  config.crossover_rate = 0.3
  config.tournment_selection_size = 3
  config.number_of_elite_schedules = 1
end

tracks = [
  ConferenceTimetable::Track.new('Track 01', 420),
  ConferenceTimetable::Track.new('Track 02', 420)
]

talks = [
  ConferenceTimetable::Talk.new('Writing Fast Tests Against Enterprise Rails', 60),
  ConferenceTimetable::Talk.new('Overdoing it in Python', 45),
  ConferenceTimetable::Talk.new('Lua for the Masses', 30),
  ConferenceTimetable::Talk.new('Ruby Errors from Mismatched Gem Versions', 45),
  ConferenceTimetable::Talk.new('Common Ruby Errors', 45),
  ConferenceTimetable::Talk.new('Rails for Python Developers lightning', 5),
  ConferenceTimetable::Talk.new('Communicating Over Distance', 60),
  ConferenceTimetable::Talk.new('Accounting-Driven Development', 45),
  ConferenceTimetable::Talk.new('Woah', 45),
  ConferenceTimetable::Talk.new('Sit Down and Write', 30),
  ConferenceTimetable::Talk.new('Pair Programming vs Noise', 45),
  ConferenceTimetable::Talk.new('Rails Magic', 60),
  ConferenceTimetable::Talk.new('Ruby on Rails: Why We Should Move On', 60),
  ConferenceTimetable::Talk.new('Clojure Ate Scala (on my project)', 45),
  ConferenceTimetable::Talk.new('Programming in the Boondocks of Seattle', 30),
  ConferenceTimetable::Talk.new('Ruby vs. Clojure for Back-End Development', 30),
  ConferenceTimetable::Talk.new('Ruby on Rails Legacy App Maintenance', 60),
  ConferenceTimetable::Talk.new('A World Without HackerNews', 30),
  ConferenceTimetable::Talk.new('User Interface CSS in Rails Apps', 30)
].shuffle

conference = ConferenceTimetable::Conference.new(tracks, talks)

schedule = ConferenceTimetable::Builder::Driver.new(conference).mount_schedule

talk_by_track = schedule.conference.talks.group_by { |talk| talk.track.name }

timetable = talk_by_track.each_with_object('') do |(key, value), text|
  text << "#{key}:\n"
  value.each { |talk| text << "#{talk.title} \(#{talk.duration}\)\n" }
end

print timetable
