require_relative './A_12_Emil_Lozev/word_counter'

def fileOrSite(filename)
	first = filename.split('/').first
	return first = 'http:' || first = 'https:'
end

def printRes(filename,option)
  if File.file? filename
    result = WordCounter.parse_file filename
  elsif fileOrSite filename
    result = WordCounter.parse_webpage filename
  else
    result = Parser.parse filename
  end

  if option == 'csv'
	puts result.to_csv
  elsif option == 'json'
    puts result.to_json
  elsif option == 'xml'
  require 'builder'
    puts result.to_xml
  else
    puts result.to_csv
  end
  
end 

filename = ARGV[0]
option = ARGV[1]
printRes(filename,option)
