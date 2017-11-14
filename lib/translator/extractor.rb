module Translator
  # lib/translator/extractor.rb
  class Extractor
    attr_reader :talks, :tracks

    TALKS_DIR = './config/talks.txt'.freeze
    TRACKS_DIR = './config/tracks.txt'.freeze

    def set_detaults
      @talks = File.readlines(TALKS_DIR)
      @tracks = File.readlines(TRACKS_DIR)[1..-1]
    end

    def initialize
      set_detaults
    end

    def extract!
      self
    end
  end
end
