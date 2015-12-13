require 'csv'
require 'rexml/document'
require 'net/http'
require 'sanitize'
require 'openssl'

sum = 0

file = ARGV[0]
account = ARGV[1].to_s
result = []
	

def to_xml my_csv

	my_csv = my_csv.sort_by { |a| [a[1].to_s.downcase , a[0].split("/")[2].to_i, a[0].split("/")[1].to_i, a[0].split("/")[0].to_i, a[3].to_i]}

  	document = REXML::Document.new('')
	  
  	node = document.add_element('minify')

  	my_csv.each do |line|
  	
    		acc = node.add_element('account')
    		date = acc.add_element('date')
    		amount = date.add_element('amount').text = "#{line[3]}"
		acc.add_attribute('', "#{line[1]}")
    		date.add_attribute('', "#{line[0]}")
    		
  	end

  	formatter = REXML::Formatters::Pretty.new
  	formatter.compact = true
  	formatter.write(document, $stdout)
  	p 
end

def link_convertor file

	url = URI.parse(file)
  	http_client = Net::HTTP.new(url.host, url.port)

  	if url.scheme == 'https'
    		http_client.use_ssl = true
    		http_client.verify_mode = OpenSSL::SSL::VERIFY_NONE
  	end

  	res = http_client.get(url.request_uri)

	result = []
  	CSV.parse(res.body) do |line|
    		result.push(line)
  	end
	
	return result
  
end

def print_and_sort_result result

	result.sort_by! do |date|
		time = date[0].split("/") 
		[time[2].to_i, time[1].to_i, time[0].to_i];
	end
	
	result.each do |line|
		puts line.join(",")
	end
end

if file.start_with?("http://", "https://")
	link_convertor file
else
  	CSV.foreach(file) do |line|
    		result.push(line)
  	end
end

result.shift

begin
		
	if account == "xml" 
		puts to_xml(my_csv)	
	end
	
	if ARGV[2] == nil
		account = ARGV[1].to_s
		 
		if line[1] == account
    			sum += line[3].to_i
    			result.push(line)
  		end
  		
  	elsif ARGV[2] != nil
  		date = ARGV[1]
  		value = ARGV[2]
  	
  		if line[0] == date && !value
  			result.push(line)
  	 	 else if line[0] == date && (value.to_i - 10 <= line[3].to_i && value.to_i + 10 >= line[3].to_i)
  			result.push(line)
  	 	 end
  		end
	end
end 

print_and_sort_result result

if ARGV[2] == nil && ARGV[1] != "xml"
	puts "The amount value for all the output rows is: #{sum}\n"
end
