require_relative 'word_counter/parser'
require_relative 'word_counter/file_parser'
require_relative 'word_counter/web_parser'
require_relative 'word_counter/result'
require_relative 'word_counter/graph_generator'

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
