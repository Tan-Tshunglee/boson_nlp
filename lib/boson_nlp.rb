require 'boson_nlp/version'

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
end
