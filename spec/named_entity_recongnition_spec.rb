require 'spec_helper'
require_relative './stubs/api_base_mock'

describe BosonNlp::NamedEntityRecongnition do

  describe 'Constructor' do
    include ApiBaseMock
    before do
      BosonNlp.configure do |config|
        config.api_token = 'test_token'
      end
    end

    before :each do
      mock_ner_analysis_api
    end

    it 'initiation success' do
      api_base = BosonNlp::NamedEntityRecongnition.new '测试文本'
      expect(api_base.token).to eq 'test_token'
    end

    it 'request and parse success' do
      api_base = BosonNlp::NamedEntityRecongnition.new '测试文本'
      entity_map = api_base.request_and_parse
      expect(entity_map['location'].size).to eq 2
    end

    it 'invalid token' do
      response = ApiBaseMock::MockedResponse.new
      response.parsed_response = {
        'status' => '403'
      }

      mock_ner_analysis_api response
      api_base = BosonNlp::NamedEntityRecongnition.new '测试文本'
      expect{api_base.request_and_parse}.to raise_exception
    end


  end
end
