require 'spec_helper'

describe BosonNlp::BosonApiBase do
  describe 'Raise token not configured error' do
    it 'error' do
      expect{BosonNlp::BosonApiBase.new}.to raise_exception RuntimeError
    end
  end

  describe 'Constructor' do
    before do
      BosonNlp.configure do |config|
        config.api_token = 'test_token'
      end
    end

    it 'new success' do
      api_base = BosonNlp::BosonApiBase.new
      expect(api_base.token).to eq 'test_token'
    end

    it 'request should raise exception' do
      api_base = BosonNlp::BosonApiBase.new
      expect{api_base.request}.to raise_exception RuntimeError
    end
  end
end
