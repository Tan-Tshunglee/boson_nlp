require 'httparty'

module BosonNlp
  # Named entity recongnition
  class BosonNamedEntityRecongnition < BosonApiBase
    class MalResponseError < Exception

    end

    # Constructor

    def initialize(text, sensitivity = 3)
      super()
      @text = text
      @query_hash = {
        'sensitivity' => sensitivity
      }
      self.body = prepare_body
      self.http_method = :post
    end

    def prepare_body
      escaped_str = @text.unpack('U*').map { |i| '\u' + i.to_s(16).rjust(4, '0') }.join
      "[\"#{escaped_str}\"]"
    end

    def api_path
      '/ner/analysis'
    end


    def request_and_parse
      request
      entity_hash = {}
      begin
        parsed_response = response.parsed_response

        if parsed_response.is_a? Hash
          status_code = parsed_response['status'].to_i
          case status_code
          when 403
            raise 'Invalid token'
          when 400...599
            raise 'Bad status code'
          end
        end

        if parsed_response.is_a? Array
          parsed_data = response.parsed_response[0]
          words = parsed_data['word']
          entities = parsed_data['entity']
          unless entities.nil? || entities.empty?
            entities.each do |entity|
              # entity array format [start_index, end_index, entity_type_string]
              # see http://docs.bosonnlp.com/ner.html
              entity_type = entity[2]
              entity_hash[entity_type] = entity_hash[entity_type] || []
              entity_hash[entity_type] << words[entity[0], entity[1]].join
            end
          end
        end
      rescue => e
        raise MalResponseError, e.message
      end
      entity_hash
    end
  end
end
