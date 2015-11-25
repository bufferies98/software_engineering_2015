class WordCounter
  def parse file
    h = Hash.new(0)
    pattern = /[,.!?'`<>*&$%^#|:+\-=;"({})\/\\\[\]@]/
    marks_sum = file.count(pattern)
    w = file.downcase.gsub(pattern, ' ').split(" ")
    w.each do |words|
      h[words] += 1
    end
    
    h = h.sort_by{|words,number| words.downcase}
    h = h.sort_by{|words,number| [-number,words]}
    return Result.new marks_sum, h
  end
  
  def parse_file filename
    string4e = ""
    f = File.open(filename, "r")
    string4e = f.read
    return parse string4e
  end
end
