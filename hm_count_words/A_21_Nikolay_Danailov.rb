require 'csv'
require 'json'
require 'rexml/document'
require 'neatjson'

@input_file = ARGV[0]
@output_format = ARGV[1]

class Result
  attr_accessor :marks
  attr_accessor :counted_words

  def initialize
    @marks = 0
    @counted_words = Hash.new 0
  end

  def to_csv
    counted_words.each { |word, count| puts word + ',' + count.to_s }
    puts "\"marks\"," + marks.to_s
  end

  def to_json
    json_output = { marks: marks, words: counted_words }
    puts JSON.neat_generate(json_output, wrap: 40)
  end

  def add_words_to_xml xml_doc
    words = xml_doc.elements['word-counts/words']

    counted_words.each do |word, count|
      word_element = words.add_element 'word'
      word_element.add_attribute 'count', count
      word_element.add_text "#{word}"
    end
  end

  def to_xml
    document = REXML::Document.new
    word_counts = document.add_element 'word-counts'
    word_counts.add_element('marks').add_text "#{marks}"
    word_counts.add_element 'words'
    add_words_to_xml document

    formatter = REXML::Formatters::Pretty.new(2)
    formatter.compact = true # makes words show up on one line
    formatter.write(document, $stdout)
  end
end


File.open(@input_file) do |file|
  text = ''

  file.each_line do |line|
    text += line
  end

  result = Result.new

  result.marks = text.scan(/[,.!?:;"()\[\]]/).count
  words = text.downcase.gsub(/[^a-z'\s-]/, '').split(' ')

  words.each do |word|
    result.counted_words[word] += 1
  end

  result.counted_words = result.counted_words.sort_by { |word, count| [-count, word] }

  if @output_format == 'json'
    result.to_json
  elsif @output_format == 'xml'
    result.to_xml
  else
    result.to_csv
  end
end
