require 'boson_nlp/version'
require 'boson_nlp/api_base'
require 'boson_nlp/named_entity_recongnition'

module BosonNlp
  # Your code goes here...

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

  def self.ner_analysis(text)
    ner = NamedEntityRecongnition.new(text)
    ner.request_and_parse
  end
end
