module Translator
  # lib/translator/transformer.rb
  class Transformer
    def set_defaults
      @talks = talks
      @tracks = tracks
      @conference = conference
      @schedule = schedule
      @talk_by_track = talk_by_track
    end

    def initialize(extractor)
      @extracted = extractor.extract!

      set_defaults
    end

    def transform!
      timetable if errors.nil?
    end

    private

    def timetable
      @talk_by_track.each_with_object('') do |(key, value), text|
        text << "#{key}:\n"
        value.each { |talk| text << "#{talk.title} \(#{talk.duration}\)\n" }
      end
    end

    def talk_by_track
      @schedule.conference.talks.group_by { |talk| talk.track.name }
    end

    def conference
      ConferenceTimetable::Conference.new(@tracks, @talks)
    end

    def schedule
      ConferenceTimetable::Builder::Driver.new(@conference).mount_schedule
    end

    def talks
      talks = []

      @extracted.talks.each do |talk|
        params = talk.split(/\s(\w+)\n$/)
        title = params.first
        duration = params.last.split('min').first
        duration = 5 if duration.eql?('lightning')
        duration = duration.to_i
        talks << ConferenceTimetable::Talk.new(title, duration)
      end

      talks
    end

    def tracks
      tracks = []

      @extracted.tracks.each do |track|
        tracks << ConferenceTimetable::Track.new(*track.split(','))
      end

      tracks
    end

    def errors
      return unless @talks.size.zero? && @tracks.size.zero?
      raise Errors::TranslatorErrors::ArgumentError
    end
  end
end
