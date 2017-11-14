require './lib/conference_timetable/config'
require './lib/conference_timetable/errors'
require './lib/conference_timetable/finder'
require './lib/conference_timetable/builder'
require './lib/conference_timetable/conference'
require './lib/conference_timetable/schedule'
require './lib/conference_timetable/talk'
require './lib/conference_timetable/track'
require './lib/conference_timetable/version'

# lib/conference_timetable.rb
module ConferenceTimetable
  def self.configure
    yield Config
  end
end
