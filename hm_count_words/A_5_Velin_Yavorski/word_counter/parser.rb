require 'word_counter/result'

module WordCounter
  class Parser
    def self.parse(string)
    res = Result.new
    punct = 0
    h = Hash.new()
    str = string.downcase.split(" ")
    str.each do |w|
      punct = punct + w.scan(/[^a-z_0123456789]/).count
      words = w.split(/[^a-z_0123456789]/)
      words.each do |word|
        word = word.gsub(/[^a-z_]/,'')
		if(word == '_')	
			punct = punct + 1
			word = word.gsub("_",'')
		end
        if(word!='')
          if(h[word])
            h[word] += 1
          else
            h[word] = 1
          end
        end
     end
   end
   h = h.sort_by { |key, value| [ -value, key ] }
   res.setWordsMarks h, punct
   res
  end
  end
end
#.,(+-
