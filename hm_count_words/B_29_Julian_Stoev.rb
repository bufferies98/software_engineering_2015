require './B_29_Julian_Stoev/word_counter.rb'
require './B_29_Julian_Stoev/result.rb'

data_source = ARGV[0]
format = ARGV[1]

url_pattern = /https?:\/\/.+/

word_counter = WordCounter.new
if data_source.match(url_pattern) == nil
	result = word_counter.parse_file(data_source)  ## .to_s ???
else
	result = word_counter.parse_url(data_source)
end

if (format=='json')
	result.to_json
elsif (format=='xml')
	result.to_xml
elsif (format=='marks')
	result.marks_count
elsif (format=='words')
	result.word_count
elsif (format=='csv' || format.nil?) 
	result.to_csv
end
result.generate_svg
