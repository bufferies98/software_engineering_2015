require 'csv'

def student_checked? checked_files, first_name, last_name
	checked_files.include? [first_name,last_name]
end

def solved? expected, result
	result.gsub(/\s+/, "") == expected ? 1: 0
end

def get_names filename
	filename.split("/").last.split("_")
end

def valid_names? names
	names.size == 4
end

def remove_file_ext value
	value.split(".").first
end

checked_files = []

CSV.open("result.csv", "w") do |csv_array|
	Dir.glob(ARGV[0]+"*").each do |filename|
			name = get_names filename
			if valid_names? name 
				last_name = remove_file_ext name[3]
				first_name = name[2]
				number = name[1]
				clazz = name[0]
				if !student_checked? checked_files,first_name,last_name
					p "#{clazz},#{number},#{first_name},#{last_name}"
					result= `ruby #{filename} 1 4 2`
					solved = solved? "-3.414213562373095,-0.5857864376269049", result
					csv_array << [clazz,number,first_name,last_name,solved]
					checked_files << [first_name, last_name]
				end
		end
	end
end

def sort_result
	my_csv = CSV.read 'result.csv'
	my_csv.sort! { |a,b| [a[0],a[1]] <=> [b[0],b[1]] }
	CSV.open("result.csv", "w") do |csv|
	  my_csv.each {|element| csv << element}
	end
end

sort_result








