require 'rexml/document'
require 'nokogiri'

#date account category amount currency description
#01/12/2014 PersonalCash K -100 BGN Some description

@my_csv = []
string = ARGV[1]

def sortby_account
	file = File.open(ARGV[0], 'r')
	file.each do |line|
		@my_csv << line
	end
	@my_csv.sort_by! do |element|
		[element[1]]
	end
end

def to_xml  
	@my_csv.sort_by! { |a| [a[1].to_s.downcase , a[0].split("/").last , a[0].split("/")[1], a[0].split("/").first, a[3].to_f]}
	my_xml = REXML::Document.new('')
	minify = my_xml.add_element('minify')
	dates = {}
	accounts = {}
	@my_csv.each do |line|
		l = line.split(',')
		if accounts.has_key?(l[1].to_s) == false
			account = minify.add_element('account')
			account.add_attribute('account',l[1].to_s)
			accounts[l[1].to_s] = account
			if dates.has_key?(l[0].to_s) == false
				date = account.add_element('date')
				date.add_attribute('date', l.first.to_s)
				dates[l[0].to_s] = date
				amount = date.add_element('amount')
				amount.add_text(l[3].to_s)
			else
				amount = dates[l[0].to_s].add_element('amount')
				amount.add_text(l[3].to_s)
			end
		else
			if dates.has_key?(l[0].to_s) == false
				date = accounts[l[1].to_s].add_element('date')
				date.add_attribute('date', l.first.to_s)
				dates[l[0].to_s] = date
				amount = date.add_element('amount')
				amount.add_text(l[3].to_s)
			else
				amount = dates[l[0].to_s].add_element('amount')
				amount.add_text(l[3].to_s)
			end
		end
	end
	my_xml
end

def sort_csv
	@my_csv.sort! {|a, b| [b[1].to_s, a[0].to_s, a[3].to_i] <=> [a[1].to_s, b[0].to_s, b[3].to_i] }
end

def xml_formatter xml
	formatter = REXML::Formatters::Pretty.new()
	formatter.compact = true
	formatter.write(xml, $stdout)
	puts ''
end

if string == 'xml'
	sortby_account
	sort_csv
	converted = to_xml
	#sorted = sort_xml converted
	#puts sorted
	xml_formatter converted
end
