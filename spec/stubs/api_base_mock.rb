module ApiBaseMock
  class MockedResponse
    attr_accessor :parsed_response
  end
  def mock_ner_analysis_api(response = nil)
    if response.nil?
      response = MockedResponse.new
      response.parsed_response = [
        {
          'tag' => %w(ns ns nz a ns m n m q vi n vi v ns n vi v f vi),
          'word' => %w(佛山市 顺德区 容桂 幸福 松排路 5 街 13 号 提货 地址 提货 到 广州 机场 帮忙 确认 下 提货),
          'entity' => [[0, 9, 'location'], [13, 15, 'location']]
        }
      ]
    end
    allow(BosonNlp::ApiBase).to receive(:post).with('/ner/analysis', anything).and_return(response)
  end
end