require 'word_counter/parser'

module WordCounter
	class FileParser < Parser
		def self.parse filename
			contents = ""
			contents = File.open(filename, "r").read
			super contents
		end
	end
end