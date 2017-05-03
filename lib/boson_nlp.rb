require 'boson_nlp/version'
require 'boson_nlp/api_base'
require 'boson_nlp/named_entity_recongnition'

# BosonNlp module
module BosonNlp
  # Your code goes here...

  # Configure host class
  class Configuration
    attr_accessor :api_token
  end

  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  # Named entity recognition analysis
  # :args text, sensitivity
  # :text text to be analysed
  def self.ner_analysis(text, sensitivity = 3)
    ner = NamedEntityRecongnition.new(text, sensitivity)
    ner.request_and_parse
  end
end
