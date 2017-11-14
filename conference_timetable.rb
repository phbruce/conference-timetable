require './conference_timetable/config'
require './conference_timetable/errors'
require './conference_timetable/finder'
require './conference_timetable/conference'
require './conference_timetable/schedule'
require './conference_timetable/talk'
require './conference_timetable/track'
require './conference_timetable/version'

# conference_timetable.rb
module ConferenceTimetable
  def self.configure
    yield Config
  end
end
