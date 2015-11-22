require 'word_counter'

describe 'WebpageParser' do
  describe '.parse' do
    it 'exists' do
      expect(WordCounter::WebpageParser).to respond_to(:parse)
    end

    it 'has parameter \'url\'' do
      expect(WordCounter::WebpageParser.method(:parse).parameters).to eql [[:req, :url]]
    end
  end
end