require 'spec_helper'

describe BosonNlp do
  it 'has a version number' do
    expect(BosonNlp::VERSION).not_to be nil
  end

  describe 'configure' do
    before do
      BosonNlp.configure do |config|
        config.api_token = 'test_token'
      end
    end

    it 'get token success' do
      configure = BosonNlp.configuration
      expect(configure.api_token).to eq 'test_token'
    end
  end
end
