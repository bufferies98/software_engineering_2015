require_relative 'word_counter/parser'
require_relative 'word_counter/file_parser'
require_relative 'word_counter/webpage_parser'
require_relative 'word_counter/result'

module WordCounter
  def self.parse(text)
    Parser.new.parse(text)
  end

  def self.parse_file(filepath)
    FileParser.new.parse(filepath)
  end

  def self.parse_webpage(url)
    WebpageParser.new.parse(url)
  end
end
