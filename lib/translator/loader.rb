module Translator
  # lib/translator/loader.rb
  class Loader
    def load!
      extractor = Extractor.new
      Transformer.new(extractor).transform!
    end
  end
end
